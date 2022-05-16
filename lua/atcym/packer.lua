local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  } 
  vim.notify 'Installing Packer. Close and re-open NeoVim.'
  vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return require('packer').startup(
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = [[require('atcym.plugins.nvim-treesitter')]],
    } 

    -- autocompletion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'

    -- snippets (autocompletion requires these)
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- colors
    use 'andersevenrud/nordic.nvim'

    -- update packer
    if PACKER_BOOTSTRAP then
      requre'packer'.sync()
    end
  end
)
