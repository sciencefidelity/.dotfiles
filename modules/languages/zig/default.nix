{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter").install({ "zig" })

      vim.lsp.enable("zls")

      require("conform").setup({
        formatters_by_ft = {
          zig = { "zigfmt" },
        },
      })
    '';
  };

  home.file = {
    ftZig = {
      enable = true;
      target = ".config/nvim/after/ftplugin/zig.lua";
      text = /*lua*/ ''
        vim.treesitter.start()
      '';
    };
  };
}
