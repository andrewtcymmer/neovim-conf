local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }
set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
set_keymap('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
set_keymap('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<cr>', opts)

local on_attach = function(client, bufnr)
  local buf_set_keymap = vim.api.nvim_buf_set_keymap
  buf_set_keymap(bufnr, 'n', 'gD',  '', {callback=vim.lsp.buf.declaration, silent=true, noremap=true})
  buf_set_keymap(bufnr, 'n', 'gd',  '', {callback=vim.lsp.buf.definition, silent=true, noremap=true})
  buf_set_keymap(bufnr, 'n', 'gi',  '', {callback=vim.lsp.buf.implementation, silent=true, noremap=true})
  buf_set_keymap(bufnr, 'n', 'gr',  '', {callback=vim.lsp.buf.references, silent=true, noremap=true})
  buf_set_keymap(bufnr, 'n', 'K',   '', {callback=vim.lsp.buf.hover, silent=true, noremap=true})
  buf_set_keymap(bufnr, 'n', '<C-k>', '', {callback=vim.lsp.buf.signature_help, silent=true, noremap=true})
  buf_set_keymap(bufnr, 'n', ' f',  '', {callback=vim.lsp.buf.formatting, silent=true, noremap=true})
  buf_set_keymap(bufnr, 'n', ' D',  '', {callback=vim.lsp.buf.type_definition, silent=true, noremap=true})
  buf_set_keymap(bufnr, 'n', ' wa', '', {callback=vim.lsp.buf.add_workspace_folder, silent=true, noremap=true})
  buf_set_keymap(bufnr, 'n', ' wr', '', {callback=vim.lsp.buf.remove_workspace_folder, silent=true, noremap=true})
  buf_set_keymap(bufnr, 'n', ' wl', '', {callback=function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, silent=true, noremap=true})
  buf_set_keymap(bufnr, 'n', ' rn', '', {callback=vim.lsp.buf.rename, silent=true, noremap=true})
  buf_set_keymap(bufnr, 'n', ' ca', '', {callback=vim.lsp.buf.code_action, silent=true, noremap=true})
end

local servers = { "rust_analyzer", "tsserver", "terraformls", "texlab" }
for _,lsp in pairs(servers) do
  require'lspconfig'[lsp].setup(
    require('atcym.lspconfig.' .. lsp).makeLspSetupOptions(on_attach)
  )
end
