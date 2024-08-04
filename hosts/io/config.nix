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
    hostname = "io";
    git.key = "0x66A86EEFF81BF185";
  };
}
