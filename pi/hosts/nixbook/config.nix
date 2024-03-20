{ config, pkgs, lib, ... }:

{
  options = with lib; with types; {
    hostname = mkOption { type = str; };
    gh_key = mkOption { type = str; };
  };
  config = {
    hostname = "nixbook";
    gh_key = "0x4C752BECEDAD41CC";
  };
}
