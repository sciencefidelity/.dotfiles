{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter").install({ "lua" })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { globals = { "vim" } },
          },
        },
      })
      vim.lsp.enable("lua_ls")

      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
        },
      })

      require("Comment.ft").set("lua", { "--%s", "--[[%s--]]" })
    '';
  };

  home.file = {
    ftLua = {
      enable = true;
      target = ".config/nvim/after/ftplugin/lua.lua";
      text = /*lua*/ ''
        vim.treesitter.start()
      '';
    };
  };
}
