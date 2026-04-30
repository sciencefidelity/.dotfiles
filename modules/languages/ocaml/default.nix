{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter").setup({
        ensure_installed = { "ocaml" },
      })

      vim.lsp.enable("ocamllsp")

      require("conform").setup({
        formatters_by_ft = {
          ocaml = { "ocamlformat" },
        },
      })
    '';
  };
}
