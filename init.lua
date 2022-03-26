require('atcym.plugins')
require('atcym.editor')

-- default color scheme
-- everforest guibg: 2f383e
-- shadorain (name: xshado) guibg: 09090d
vim.api.nvim_command([[
  augroup ChangeBackgroundColor
    autocmd colorscheme * :hi normal guibg=#2f383e
  augroup END
]])
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.cmd [[silent! colorscheme everforest]]

-- autocompletion
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })
  },
  sources = {
    { name = 'vsnip' },
    { name = 'buffer' },
    { name = 'nvim_lsp' }
  }
})

-- typescript: find a better place for this
require'lspconfig'.tsserver.setup {
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

