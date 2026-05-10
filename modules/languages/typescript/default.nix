{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter").install({ "javascript", "tsx", "typescript" })

      vim.lsp.enable("ts_ls")

      require("conform").setup({
        formatters_by_ft = {
          jsx = { "prettierd", "prettier", stop_after_first = true },
          javascript = { "prettierd", "prettier", stop_after_first = true },
          tsx = { "prettierd", "prettier", stop_after_first = true },
          typescript = { "prettierd", "prettier", "deno_fmt", stop_after_first = true },
        },
      })
      ${builtins.readFile ./snippets.lua}
    '';
  };

  home.file = {
    ftTypescript = {
      enable = true;
      target = ".config/nvim/after/ftplugin/typescript.lua";
      text = /*lua*/ ''
        vim.treesitter.start()
      '';
    };
  };
}
