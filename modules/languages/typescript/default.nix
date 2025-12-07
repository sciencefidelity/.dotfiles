{ ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "javascript", "tsx", "typescript" },
      })

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
}
