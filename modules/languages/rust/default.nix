{ ... }:

let
  sqlQuery = /*scheme*/ ''
    (macro_invocation
      macro: (scoped_identifier
        path: (identifier) @_path (#eq? @_path "sqlx")
        name: (identifier) @_name (#any-of? @_name "query" "query_as" "query_scalar")
      )
      (token_tree
        (_ (string_content) @injection.content)
        (#set! injection.language "sql")
      )
    )

    (call_expression
      (scoped_identifier
        path: (identifier) @path (#eq? @path "sqlx")
        name: (identifier) @name (#any-of? @name "query" "query_as" "query_scalar"))
      (arguments
        (_ (string_content) @injection.content)
        (#set! injection.language "sql")))
  '';
in
{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "rust" },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "rs" },
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = true
          vim.treesitter.start()
        end,
      })

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust_analyzer"] = {
            diagnostics = { enable = false },
            cargo = { features = "all" },
          },
        },
      })
      vim.lsp.enable("rust_analyzer");

      require("conform").setup({
        formatters_by_ft = {
          rust = { "rustfmt" },
        },
      })

      ${builtins.readFile ./snippets.lua}
    '';
  };

  home.file = {
    inlineSql = {
      enable = true;
      target = ".config/nvim/queries/rust/injections.scm";
      text = sqlQuery;
    };
  };
}
