return require('packer').startup({
  function(use)
    -- Packer can manage itself
    use({ 'wbthomason/packer.nvim' })
    use({ 'neovim/nvim-lspconfig' })
    -- Install nvim-cmp, and buffer source as a dependency
    use({ 'hrsh7th/vim-vsnip' })
    use({ 'hrsh7th/cmp-buffer' })
    use({ 'hrsh7th/cmp-nvim-lsp' })
    use({
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/vim-vsnip',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
      }
    })
    -- colors
    use({ 'andersevenrud/nordic.nvim' })
  end,

  config = {}
})

