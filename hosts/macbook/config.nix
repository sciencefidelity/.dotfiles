{ config, lib, ... }:

{
  options = with lib; with types; {
    hostname = mkOption { type = str; };
    gh_key = mkOption { type = str; };
  };
  config = {
    hostname = "macbook";
    gh_key = "22C1322FB7B3F0B2";
  };
}
