{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      redis
    ];
  };

  services.redis = {
    package = pkgs.redis;
    vmOverCommit = true;
  };
}
