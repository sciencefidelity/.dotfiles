{ ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "svelte" },
      })

      require("lspconfig").svelte.setup({})

      require("conform").setup({
        formatters_by_ft = {
          svelte = { "prettier" },
        },
      })
    '';
  };
}
