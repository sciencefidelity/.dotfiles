{ ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "zig" },
      })

      vim.lsp.enable("zls")

      require("conform").setup({
        formatters_by_ft = {
          zig = { "zigfmt" },
        },
      })
    '';
  };
}
