{ ... }:

{
  home.file = {
    direnv = {
      enable = true;
      target = ".config/direnv/direnv.toml";
      text = /*toml*/ ''
        [global]
        # https://direnv.net/man/direnv.toml.1.html
        hide_env_diff = true
      '';
    };
  };

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
