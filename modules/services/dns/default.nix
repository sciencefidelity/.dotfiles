{ pkgs, ... }:

{
  networking.firewall.allowedUDPPorts = [ 53 ];
  networking.firewall.allowedTCPPorts = [ 53 ];

  services.bind = {
    enable = true;
    zones = {
      "local.augment.aero" = {
        master = true;
        file = pkgs.writeText "local.augment.aero" ''
          $TTL    1h
          $ORIGIN local.augment.aero.
          @       IN  SOA   ns1.local.augment.aero hostmaster.local.augment.aero (
                                2003080800 ; serial number
                                12h        ; refresh
                                15m        ; update retry
                                4d         ; expiry
                                2h         ; minimum
                                )

                  IN  NS    ns1.local.augment.aero.

          ns1     IN  A     192.168.1.125
          api     IN  A     192.168.1.122
          app     IN  A     192.168.1.122
          ca      IN  A     192.168.1.125
        '';
      };
    };
  };
}
