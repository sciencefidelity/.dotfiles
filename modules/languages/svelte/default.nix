{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter").install({ "svelte" })

      vim.lsp.enable("svelte")

      require("conform").setup({
        formatters_by_ft = {
          svelte = { "prettierd", "prettier", stop_after_first = true },
        },
      })
    '';
  };

  home.file = {
    ftSvelte = {
      enable = true;
      target = ".config/nvim/after/ftplugin/svelte.lua";
      text = /*lua*/ ''
        vim.treesitter.start()
      '';
    };
  };
}
