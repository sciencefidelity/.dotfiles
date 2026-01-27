{ ... }:

{
  networking.firewall.allowedTCPPorts = [ 443 ];

  services.step-ca = {
    enable = true;
    address = "0.0.0.0";
    port = 443;
    openFirewall = true;
    intermediatePasswordFile = "/var/lib/secrets/step-ca/intermediatePasswordFile";
    # settings = builtins.fromJSON (builtins.readFile /var/lib/step-ca/config/ca.json);
    settings = {
      root = "/var/lib/step-ca/certs/root_ca.crt";
      crt = "/var/lib/step-ca/certs/intermediate_ca.crt";
      key = "/var/lib/step-ca/secrets/intermediate_ca_key";
      address = ":443";
      dnsNames = [ "ca.augment.aero" ];
      logger.format = "text";
      db = {
        type = "badgerv2";
        dataSource = "/var/lib/step-ca/db";
      };
      authority = {
        provisioners = [
          {
            type = "ACME";
            name = "acme";
          }
        ];
      };
      tls = {
        cipherSuites = [
          "TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256"
          "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256"
        ];
        minVersion = 1.2;
        maxVersion = 1.3;
        renegotiation = false;
      };
    };
  };

  # systemd.services.step-ca = {
  #   serviceConfig = {
  #     ExecStart = lib.mkForce [
  #       ""
  #       "${pkgs.step-ca}/bin/step-ca /home/matt/.step/config/ca.json --password-file /var/lib/secrets/step-ca/intermediatePasswordFile"
  #     ];
  #     Restart = "always";
  #   };
  # };
}
