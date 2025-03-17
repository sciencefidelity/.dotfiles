{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      redis
    ];
  };

  services.redis = {
    package = pkgs.redis;
    servers."augementaero" = {
      enable = true;
      port = 6379;
    };
    vmOverCommit = true;
  };
}
