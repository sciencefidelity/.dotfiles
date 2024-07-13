{ ... }:

{
  home = {
    file = {
      direnv = {
        enable = true;
        target = ".config/direnv/direnv.toml";
        text = /*toml*/ ''
          [global]
          # https://direnv.net/man/direnv.toml.1.html
          disable_stdin = true
          load_dotenv = true
          strict_env = true
          hide_env_diff = true
        '';
      };
    };

    sessionVariables = {
      DIRENV_LOG_FORMAT = "";
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
