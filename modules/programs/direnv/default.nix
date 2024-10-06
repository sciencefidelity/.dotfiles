{ ... }:

{
  home = {
    sessionVariables = {
      DIRENV_LOG_FORMAT = "";
    };
  };

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      # https://direnv.net/man/direnv.toml.1.html
      config = {
        global = {
          disable_stdin = true;
          load_dotenv = false;
          strict_env = true;
          hide_env_diff = true;
        };
      };
      nix-direnv.enable = true;
      silent = true;
    };
  };
}
