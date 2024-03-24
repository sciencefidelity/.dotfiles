{ lib, ... }:

{
  options = with lib; with types; {
    hostname = mkOption { type = str; };
    git.key = mkOption { type = str; };
  };
  config = {
    hostname = "pi";
    git.key = "0x6D04AAF40371DB76";
  };
}
