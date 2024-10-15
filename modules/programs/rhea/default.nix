{ config, pkgs, ... }:

{
  home = {
    file = {
      rhea = {
        enable = true;
        target = ".config/rhea/config.toml";
        text = /*toml*/ ''
          [user]
          name = "Matt Cook"
          email = "matt@mattcook.dev"
          github_username = "sciencefidelity"

          [package]
          license = "MIT or Apache-2.0"
        '';
      };
    };
  };
}
