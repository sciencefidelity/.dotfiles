{ lib, ... }:

{
  platform = with lib; with types; {
    system = mkOption { type = strMatching "(darwin|linux)"; };
    hostname = mkOption { type = str; };
    git.key = mkOption { type = str; };
  };
  config = {
    platform = "linux";
    hostname = "pi";
    git.key = "0x6D04AAF40371DB76";
  };
}
