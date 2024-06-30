{ pkgs, ... }:

{
  services.k3s = {
    enable = true;
    role = "server";
    token = "11e0e34bd65a5923317b73d438c37238";
    clusterInit = true;
  };
}
