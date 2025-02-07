{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      neovim-unwrapped
    ];

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "${config.home.sessionVariables.EDITOR}";
    };
  };

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    defaultEditor = true;
    extraLuaConfig = /*lua*/ ''
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
