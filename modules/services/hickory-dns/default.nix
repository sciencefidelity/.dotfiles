{ pkgs, ... }:

{


  networking.firewall.allowedUDPPorts = [ 53 ];
  networking.firewall.allowedTCPPorts = [ 53 ];

  services.hickory-dns = {
    enable = true;
    settings = {
      listen_addrs_ipv4 = [ "192.168.1.125" "127.0.0.1" ];
      zones."local.augment.aero" = {
        zone = "local.augment.aero";
        zone_type = "Primary";
        # file = "/var/lib/hickory-dns/local.augment.aero.zone";
        file = pkgs.writeText "/var/lib/hickory-dns/local.mattcook.dev.zone" ''
          $ORIGIN local.mattcook.dev.
          $TTL 3600

          @       IN  SOA   ns1.local.mattcook.dev. admin.local.mattcook.dev. (
                            2024010101  ; serial (update when you change records)
                            3600        ; refresh
                            600         ; retry
                            604800      ; expire
                            86400 )     ; minimum TTL

                  IN  NS    ns1.local.mattcook.dev.

          ns1     IN  A     192.168.1.125
          ca      IN  A     192.168.1.125
          app     IN  A     192.168.1.122
          api     IN  A     192.168.1.122
        '';
      };
    };
  };

  systemd.tmpfiles.rules = [ "d /tmp/lib/hickory-dns 0755 hickory-dns hickory-dns -" ];
}
