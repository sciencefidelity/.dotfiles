{ config, ... }:

let
  username = config.username;
in
{
  virtualisation.docker = {
    enable = true;
  };

  users.extraGroups.docker.members = [ username ];
}
