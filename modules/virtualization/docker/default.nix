{ config, ... }:

let
  username = config.username;
in
{
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  # users..extraGroups.docker.members = [ username ];
}
