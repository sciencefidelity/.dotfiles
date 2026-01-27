{ pkgs, ... }:

{
  networking.firewall.allowedUDPPorts = [ 53 ];
  networking.firewall.allowedTCPPorts = [ 53 ];

  services.bind = {
    enable = true;
    zones = {
      "augment.aero" = {
        master = true;
        file = pkgs.writeText "augment.aero" ''
          $TTL    1h
          $ORIGIN augment.aero.
          @       IN  SOA   ns1.augment.aero hostmaster.augment.aero (
                                2003080800 ; serial number
                                12h        ; refresh
                                15m        ; update retry
                                4d         ; expiry
                                2h         ; minimum
                                )

                  IN  NS    ns1.augment.aero.

          ns1     IN  A     192.168.1.125
          api     IN  A     192.168.1.122
          @       IN  A     192.168.1.122
          ca      IN  A     192.168.1.125
        '';
      };
    };
  };
}
