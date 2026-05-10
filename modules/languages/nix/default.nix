{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      nixd
      nixpkgs-fmt
    ];
  };

  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter").install({ "hyprlang", "nix" })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "nix" },
        callback = function()
          vim.treesitter.start()
          vim.opt_local.tabstop = 2
          vim.opt_local.softtabstop = 2
          vim.opt_local.shiftwidth = 2
          vim.opt_local.expandtab = true
        end,
      })

      vim.lsp.enable("nixd")

      require("conform").setup({
        formatters_by_ft = {
          nix = { "nixpkgs_fmt" },
        },
      })
    '';
  };

  home.file = {
    ftNix = {
      enable = true;
      target = ".config/nvim/after/ftplugin/nix.lua";
      text = /*lua*/ ''
        vim.treesitter.start()
      '';
    };
  };
}
