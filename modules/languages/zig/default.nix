{ ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "zig" },
      })

      require("lspconfig").zls.setup({})

      require("conform").setup({
        formatters_by_ft = {
          zig = { "zigfmt" },
        },
      })
    '';
  };
}
