local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']g', '<CMD>lua vim.diagnostic.goto_next()<CR>', { noremap=true, silent=true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[g', '<CMD>lua vim.diagnostic.goto_prev()<CR>', { noremap=true, silent=true })
end

require('atcym.lspconfig.terraform').setup(on_attach)
