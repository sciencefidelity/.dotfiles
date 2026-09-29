{ pkgs, ... }:

{
  services = {
    postgresql = {
      enable = true;
      enableTCPIP = true;

      authentication = pkgs.lib.mkOverride 10 ''
        #type database DBuser origin-address auth-method
        local all      all                   trust
        host  all      all    127.0.0.1/32   trust
        host  all      all    ::1/128        trust
        host  all      all    192.168.1.0/24 md5
      '';
    };
  };

  networking = {
    firewall.allowedTCPPorts = [ 5432 ];
  };
}
