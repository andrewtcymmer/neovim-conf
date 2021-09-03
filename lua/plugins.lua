-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'sainnhe/everforest' -- compatible with treesitter
  use 'sainnhe/gruvbox-material' -- compatible with treesitter
  use 'Shadorain/shadotheme' -- alias is 'xshado'; not known to be compatible with treesitter
end)

