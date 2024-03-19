{ config, pkgs, lib, ... }:

{
  options = with lib; with types; {
    user = mkOption { type = str; };
    org = mkOption { type = str; };
    gh_email = mkOption { type = str; };
  };
  config = {
    user = "matt";
    org = "sciencefidelity";
    gh_email = "32623301+sciencefidelity@users.noreply.github.com";
  };
}
