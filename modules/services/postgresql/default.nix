{ pkgs, ... }:
{
  config = {
    services.postgresql = {
      enable = true;
      enableTCPIP = true;
      ensureDatabases = [ "mydatabase" ];
      # settings.ssl = true;
      authentication = pkgs.lib.mkOverride 10 ''
        #type database DBuser auth-method
        local all      all    trust
        #type database DBuser origin-address            auth-method
        # ipv4
        host  all      all    127.0.0.1/32              trust
        host  all      all    192.168.1.0 255.255.255.0 trust
        # ipv6
        host  all      all    ::1/128                   trust
      '';
      # initialScript = pkgs.writeText "backend-initScript" ''
      #   CREATE ROLE nixcloud WITH LOGIN PASSWORD 'nixcloud' CREATEDB;
      #   CREATE DATABASE nixcloud;
      #   GRANT ALL PRIVILEGES ON DATABASE nixcloud TO nixcloud;
      # '';
    };

    environment = {
      defaultPackages = with pkgs; [
        postgresql
      ];
    };
  };
}
