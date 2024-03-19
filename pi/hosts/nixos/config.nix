{ config, pkgs, lib, ... }:

{
  options = with lib; with types; {
    hostname = mkOption { type = str; };
    gh_key = mkOption { type = str; };
  };
  config = {
    hostname = "nixos";
    gh_key = "0x5D677EB50DA594C9";
  };
}
