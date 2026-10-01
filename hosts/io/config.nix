{ lib, ... }:

{
  imports = [ ../../base/config.nix ];

  options = with lib; with types; {
    hostname = mkOption { type = str; };
    git.key = mkOption { type = str; };
  };
  config = {
    hostname = "io";
    git.key = "0x66A86EEFF81BF185";
  };
}
