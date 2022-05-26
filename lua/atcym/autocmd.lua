-- autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()
-- See :h api-autocmd for details
vim.api.nvim_create_autocmd(
  "BufWritePre",
  {
    pattern = { "*.tf" },
    callback = vim.lsp.buf.formatting_sync,
  }
)
