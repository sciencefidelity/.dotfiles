{ ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "terraform", "hcl" },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "tf" },
        callback = function()
          vim.opt_local.tabstop = 2
          vim.opt_local.softtabstop = 2
          vim.opt_local.shiftwidth = 2
          vim.opt_local.expandtab = true
        end,
      })

      require("lspconfig").terraform_lsp.setup({})

      require("conform").setup({
        formatters_by_ft = {
          terraform = { "terraform_fmt" },
          tf = { "terraform_fmt" },
          ["terraform-vars"] = { "terraform_fmt" },
        },
      })
    '';
  };
}
