-- https://github.com/hashicorp/terraform-ls/blob/main/docs/USAGE.md#neovim-v050
local Module = {}

function Module.setup(on_attach)
  local caps = vim.lsp.protocol.make_client_capabilities()
  caps.textDocument.completion.completionItem.snippetSupport = true

  require('lspconfig').terraformls.setup({
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
    capabilities = caps,
  })
end

return Module
