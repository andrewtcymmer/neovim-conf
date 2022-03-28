local Module = {}

function Module.setup(on_attach)
  -- commented line below is from original typescript configuration
  -- local caps = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local caps = vim.lsp.protocol.make_client_capabilities()
  caps.textDocument.completion.completionItem.snippetSupport = true

  require('lspconfig').tsserver.setup({
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
    capabilities = caps,
  })
end

return Module
