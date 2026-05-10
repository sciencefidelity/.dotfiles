{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter").install({ "clojure" })

      vim.lsp.enable("clojure_lsp")

      require("conform").setup({
        formatters_by_ft = {
          clojure = { "cljfmt" },
        },
      })
    '';
  };

  home.file = {
    ftClojure = {
      enable = true;
      target = ".config/nvim/after/ftplugin/clojure.lua";
      text = "vim.treesitter.start()";
    };
  };
}
