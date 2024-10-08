{ config, pkgs, ... }:

let
  platform = config.platform;
in
{
  home = {
    packages = [
      pkgs.clang-tools
      pkgs.lldb
    ] ++ (if platform == "linux" then [ pkgs.gdb pkgs.valgrind ] else [ ]);

    file =
      if platform == "linux" then {
        gdbinit = {
          enable = true;
          target = ".gdbinit";
          text = /*bash*/ ''
            set disassembly intel
          '';
        };
      } else { };
  };

  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "cpp" },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "c", "cpp" },
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = true
        end,
      })

      require("lspconfig").clangd.setup({
        filetypes = { "c", "cpp", "objc", "objcpp" },
      })

      require("conform").setup({
        formatters_by_ft = {
          c = { "clang_format" },
          cpp = { "clang_format" },
        },
      })
    '';
  };
}
