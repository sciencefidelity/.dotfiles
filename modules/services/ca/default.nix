{ lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    step-ca
    step-cli
  ];

  networking.firewall.allowedTCPPorts = [ 443 ];

  services.step-ca = {
    enable = false;
    address = "0.0.0.0";
    port = 443;
    openFirewall = true;
    intermediatePasswordFile = "/var/lib/secrets/step-ca/intermediatePasswordFile";
    settings = builtins.fromJSON (builtins.readFile /var/lib/step-ca/config/ca.json);
  };

  systemd.services.step-ca = {
    serviceConfig = {
      ExecStart = lib.mkForce [
        ""
        "${pkgs.step-ca}/bin/step-ca /var/lib/step-ca/config/ca.json --password-file /var/lib/secrets/step-ca/intermediatePasswordFile"
      ];
      Restart = "always";
    };
  };
}
