{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      redis
    ];
  };

  services.redis = {
    package = pkgs.redis;
    vmOverCommit = true;
  };
}
