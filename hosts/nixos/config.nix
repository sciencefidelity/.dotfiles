{ lib, ... }:

{
  options = with lib; with types; {
    hostname = mkOption { type = str; };
    git.key = mkOption { type = str; };
  };
  config = {
    hostname = "nixos";
    git.key = "0x5D677EB50DA594C9";
  };
}
