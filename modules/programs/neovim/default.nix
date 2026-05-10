{ config, pkgs, ... }:

{
  home = {
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "${config.home.sessionVariables.EDITOR}";
    };

    file = {
      ftBash = {
        enable = true;
        target = ".config/nvim/after/ftplugin/bash.lua";
        text = /*lua*/ ''
          vim.treesitter.start()
        '';
      };

      ftCss = {
        enable = true;
        target = ".config/nvim/after/ftplugin/css.lua";
        text = /*lua*/ ''
          vim.treesitter.start()
        '';
      };

      ftDockerfile = {
        enable = true;
        target = ".config/nvim/after/ftplugin/dockerfile.lua";
        text = /*lua*/ ''
          vim.treesitter.start()
        '';
      };

      ftHtml = {
        enable = true;
        target = ".config/nvim/after/ftplugin/html.lua";
        text = /*lua*/ ''
          vim.treesitter.start()
        '';
      };

      ftMarkdown = {
        enable = true;
        target = ".config/nvim/after/ftplugin/markdown.lua";
        text = /*lua*/ ''
          vim.treesitter.start()
        '';
      };

      ftRuby = {
        enable = true;
        target = ".config/nvim/after/ftplugin/ruby.lua";
        text = /*lua*/ ''
          vim.treesitter.start()
        '';
      };

      ftScheme = {
        enable = true;
        target = ".config/nvim/after/ftplugin/scheme.lua";
        text = /*lua*/ ''
          vim.treesitter.start()
        '';
      };

      ftScss = {
        enable = true;
        target = ".config/nvim/after/ftplugin/scss.lua";
        text = /*lua*/ ''
          vim.treesitter.start()
        '';
      };

      ftToml = {
        enable = true;
        target = ".config/nvim/after/ftplugin/toml.lua";
        text = /*lua*/ ''
          vim.treesitter.start()
        '';
      };

      ftWsgl = {
        enable = true;
        target = ".config/nvim/after/ftplugin/wsgl.lua";
        text = /*lua*/ ''
          vim.treesitter.start()
        '';
      };

      ftYaml = {
        enable = true;
        target = ".config/nvim/after/ftplugin/yaml.lua";
        text = /*lua*/ ''
          vim.treesitter.start()
        '';
      };
    };
  };

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    defaultEditor = true;
    initLua = /*lua*/ ''
      ${builtins.readFile ./core/remap.lua}
      ${builtins.readFile ./core/lazy.lua}
      ${builtins.readFile ./core/editor.lua}
      ${builtins.readFile ./core/colorscheme.lua}
      ${builtins.readFile ./core/spell.lua}
      ${builtins.readFile ./plugins/comment.lua}
      ${builtins.readFile ./plugins/conform.lua}
      ${builtins.readFile ./plugins/indent-blankline.lua}
      ${builtins.readFile ./plugins/lspconfig.lua}
      ${builtins.readFile ./plugins/nvim-autopairs.lua}
      ${builtins.readFile ./plugins/nvim-cmp.lua}
      ${builtins.readFile ./plugins/telescope.lua}
      ${builtins.readFile ./plugins/treesitter.lua}
    '';
    # withNodeJs = true;
    viAlias = true;
    vimAlias = true;
  };
}
