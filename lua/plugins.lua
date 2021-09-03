return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'  -- autocompletion with typescript import support
  -- colors
  use 'sainnhe/everforest' -- compatible with treesitter
  use 'sainnhe/gruvbox-material' -- compatible with treesitter
  use 'Shadorain/shadotheme' -- alias is 'xshado'; not known to be compatible with treesitter
end)

