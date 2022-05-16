# neovim-conf
My NeoVim configuration.

# From a Fresh Start
From an install with no plugins (including packer) do this:
1. `git clone git@github.com:andrewtcymmer/neovim-conf ~/.config/nvim/`
1. `nvim` to open. You will see an error, but packer has been installed. Exit (`ZQ`)
1. `nvim` to open again. You will see the same error. Run `:PackerInstall`.
1. `nvim` to open yet again. You will see an error about tree-sitter. However, tree-sitter updates itself after this error, which will make it go away on next open.
1. `nvim` is now ready to rip!

