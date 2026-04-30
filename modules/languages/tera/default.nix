{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter").setup({
        ensure_installed = { "tera" },
      })
    '';
  };
}
