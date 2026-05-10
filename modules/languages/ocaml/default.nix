{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter").install({ "ocaml" })

      vim.lsp.enable("ocamllsp")

      require("conform").setup({
        formatters_by_ft = {
          ocaml = { "ocamlformat" },
        },
      })
    '';
  };

  home.file = {
    ftOcaml = {
      enable = true;
      target = ".config/nvim/after/ftplugin/ocaml.lua";
      text = /*lua*/ ''
        vim.treesitter.start()
      '';
    };
  };
}
