{ pkgs, ... }:

let
  fqdn = "home.mattcook.dev";
  stateDir = "/var/lib/ddns";
  ddns = pkgs.writeShellApplication {
    name = "ddns";

    runtimeInputs = with pkgs; [
      curl
    ];

    text = /*bash*/ ''
      set -euo pipefail

      : "''${CF_API_TOKEN:?missing CF_API_TOKEN}"
      : "''${CF_ZONE_ID:?missing CF_ZONE_ID}"
      : "''${CF_RECORD_ID_V4:?missing CF_RECORD_ID_V4}"

      mkdir -p ${stateDir}
      last_v4_file="${stateDir}/last_ipv4"

      cur_v4="$(curl -fsS https://api.ipify.org)"
      last_v4=""
      [[ -f "$last_v4_file" ]] && last_v4="$(cat "$last_v4_file" || true)"

      if [[ "$cur_v4" != "$last_v4" ]]; then
        json_body='{
          "name": "'"${fqdn}"'",
          "ttl": 120,
          "type": "A",
          "comment": "Home DNS changed",
          "content": "'"$cur_v4"'",
          "proxied": false
        }'

        curl -fsS -X PUT \
          "https://api.cloudflare.com/client/v4/zones/''${CF_ZONE_ID}/dns_records/''${CF_RECORD_ID_V4}" \
          -H "Authorization: Bearer ''${CF_API_TOKEN}" \
          -H "Content-Type: application/json" \
          -d "$json_body"

        echo "$cur_v4" > "$last_v4_file"
      fi
    '';
  };
in
{
  systemd.services.ddns = {
    description = "Cloudflare DDNS update";
    serviceConfig = {
      Type = "oneshot";
      User = "root";
      ExecStart = "${ddns}/bin/ddns";
      EnvironmentFile = "/etc/secrets/ddns.env";
    };
  };

  systemd.timers.ddns = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "2m";
      OnUnitActiveSec = "10m";
      Persistent = true;
    };
  };
}
