{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      redis
    ];
  };

  services.redis = {
    package = pkgs.redis;
    servers."augmentaero" = {
      bind = null;
      enable = true;
      openFirewall = true;
      port = 6379;
      requirePass = "password";
    };
    vmOverCommit = true;
  };
}
