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
      enable = true;
      port = 6379;
    };
    vmOverCommit = true;
  };
}
