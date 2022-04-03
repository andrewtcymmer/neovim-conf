local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']g', '<CMD>lua vim.diagnostic.goto_next()<CR>', { noremap=true, silent=true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[g', '<CMD>lua vim.diagnostic.goto_prev()<CR>', { noremap=true, silent=true })
end

-- set up a common capabilities copy for all languages
local caps = vim.lsp.protocol.make_client_capabilities()
caps.textDocument.completion.completionItem.snippetSupport = true
local servers = { "rust_analyzer", "terraformls", "tsserver" }
for _,lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = caps,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150
    },
    settings = require('atcym.lspconfig.' .. lsp).settings
  }
end

-- require('atcym.lspconfig.rust').setup(on_attach)
-- require('atcym.lspconfig.terraform').setup(on_attach)
-- require('atcym.lspconfig.typescript').setup(on_attach)
