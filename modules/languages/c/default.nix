{ lib, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      clang-tools
    ] ++ lib.optionals stdenv.hostPlatform.isLinux [
      gdb
      valgrind
    ];

    file =
      lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
        gdbinit = {
          enable = true;
          target = ".gdbinit";
          text = /*bash*/ ''
            set disassembly intel
          '';
        };
      };
  };

  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter").install({ "c", "cpp" })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "c", "cpp" },
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = true
        end,
      })

      vim.lsp.config("clangd", {
        filetypes = { "c", "cpp", "objc", "objcpp" },
      })
      vim.lsp.enable("clangd")

      require("conform").setup({
        formatters_by_ft = {
          c = { "clang_format" },
          cpp = { "clang_format" },
        },
      })
    '';
  };
}
