{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      redis
    ];
  };
}
