{ lib, ... }:

{
  options = with lib; with types; {
    platform = mkOption { type = strMatching "(darwin|linux)"; };
    hostname = mkOption { type = str; };
    git.key = mkOption { type = str; };
  };
  config = {
    platform = "linux";
    hostname = "nixos";
    git.key = "0x5D677EB50DA594C9";
  };
}
