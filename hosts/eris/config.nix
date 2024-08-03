{ lib, ... }:

{
  imports = [ ../../base/config.nix ];

  options = with lib; with types; {
    platform = mkOption { type = strMatching "(darwin|linux)"; };
    hostname = mkOption { type = str; };
    git.key = mkOption { type = str; };
  };
  config = {
    platform = "linux";
    hostname = "eris";
    git.key = "0x6D04AAF40371DB76";
  };
}
