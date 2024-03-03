-- local lsp_document_format_augroup = vim.api.nvim_create_augroup("lsp_document_format", { clear = true })

-- local set_up_lsp_autoformatting = function()
--   vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--     pattern = { "*" },
--     callback = function()
--       vim.lsp.buf.format()
--     end,
--     group = lsp_document_format_augroup,
--   })
-- end

-- set_up_lsp_autoformatting()
