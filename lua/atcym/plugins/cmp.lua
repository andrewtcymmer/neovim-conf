-- local set_keymap = vim.api.nvim_set_keymap
-- local opts = { noremap=true, silent=true }
-- set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
-- set_keymap('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
-- set_keymap('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
-- set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<cr>', opts)

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

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- cmp_nvim_lsp
    "neovim/nvim-lspconfig", -- lspconfig
    "onsails/lspkind-nvim", -- lspkind (VS pictograms)
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      dependencies = {"rafamadriz/friendly-snippets"}, -- Snippets
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        -- https://github.com/rafamadriz/friendly-snippets/blob/main/snippets/go.json
      end
    }, {"saadparwaiz1/cmp_luasnip", enabled = true}
  },
  config = function()
    local luasnip = require'luasnip'
    local types = require'luasnip.util.types'

    -- Display virtual text to indicate snippet has more nodes
    luasnip.config.setup({
      ext_opts = {
                [types.choiceNode] = {
                    active = {virt_text = {{"⇥", "GruvboxRed"}}}
                },
                [types.insertNode] = {
                    active = {virt_text = {{"⇥", "GruvboxBlue"}}}
                }
            }
    })

    local cmp = require'cmp'
    local lspkind = require'lspkind'

    cmp.setup({
      snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({select = true}),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, {"i", "s"})
      }),
      sources = cmp.config.sources({
        {name = "nvim_lsp"}, {name = "luasnip"}, {name = "buffer"}
      }),
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 70,
          show_labelDetails = true
        })
      }
    })

    local lspconfig = require'lspconfig'
    local servers = { "gopls", "terraformls" }
    for _,lsp in pairs(servers) do
      require'lspconfig'[lsp].setup(
        require('atcym.lspconfig.' .. lsp).makeLspSetupOptions(on_attach)
      )
    end

    -- All languages: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

    -- Default lspconfig values for Go are set by `navigator`
    -- Go: go install golang.org/x/tools/gopls@latest
  end
}
