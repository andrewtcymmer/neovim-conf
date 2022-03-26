return require('packer').startup({
  function(use)
    -- Packer can manage itself
    use({ 'wbthomason/packer.nvim' })
    use({ 'neovim/nvim-lspconfig',
      config = [[require('atcym.lspconfig')]],
      requires = {}
    })
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
    use({ 'sainnhe/everforest' }) -- compatible with treesitter
    use({ 'sainnhe/gruvbox-material' }) -- compatible with treesitter
  end,

  config = {}
})

