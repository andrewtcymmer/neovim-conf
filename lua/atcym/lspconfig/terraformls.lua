-- https://github.com/hashicorp/terraform-ls/blob/main/docs/USAGE.md#neovim-v050
local Module = {}

local root_pattern = require'lspconfig'.util.root_pattern

Module.makeLspSetupOptions = function(on_attach)
  local caps = vim.lsp.protocol.make_client_capabilities()
  caps = require('cmp_nvim_lsp').default_capabilities(caps) -- enable language server completion
  caps.textDocument.completion.completionItem.snippetSupport = true
  return {
    capabilities = caps,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150
    },
    -- The following are defaults according to the docs. Added so as not to overwrite with empty values.
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#terraformls
    cmd = { "terraform-ls", "serve" },
    filetypes = { "terraform", "terraform-vars" },
    root_dir = root_pattern(".terraform") -- , ".git" omitted since I work primarily in monorepos
  }
end

return Module
