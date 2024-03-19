{ config, pkgs, lib, ... }:

{
  options = with lib; with types; {
    hostname = mkOption { type = str; };
    gh_key = mkOption { type = str; };
  };
  config = {
    hostname = "pi";
    gh_key = "0x6D04AAF40371DB76";
  };
}
