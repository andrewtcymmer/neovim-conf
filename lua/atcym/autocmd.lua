-- autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()
-- See :h api-autocmd for details
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = { "*.tf", "*.tfvars" },
  callback = function(ev)
    -- print(string.format('event fired: %s', vim.inspect(ev)))
    vim.lsp.buf.format()
  end,
})
