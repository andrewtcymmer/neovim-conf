local on_attach = function(client, bufnr)
  buf_set_keymap('n', ']g', '<CMD>lua vim.lsp.diagnostic.goto_next()<CR>', { noremap=true, silent=true })
  buf_set_keymap('n', '[g', '<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap=true, silent=true })
end
