local Module = {}

Module.makeLspSetupOptions = function(on_attach)
  local caps = vim.lsp.protocol.make_client_capabilities()
  caps.textDocument.completion.completionItem.snippetSupport = true
  return {
    capabilities = caps,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150
    }
  }
end

return Module
