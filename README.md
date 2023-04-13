# neovim-conf
My NeoVim configuration.

# From a Fresh Start
From an install with no plugins (including packer) do this:
1. `git clone git@github.com:andrewtcymmer/neovim-conf ~/.config/nvim/`
1. `nvim` to open. You will see an error, but packer has been installed. Exit (`ZQ`)
1. `nvim` to open again. You will see the same error. Run `:PackerInstall`.
1. `nvim` to open yet again. You will see an error about tree-sitter. However, tree-sitter updates itself after this error, which will make it go away on next open.
1. `nvim` is now ready to rip!

# LSP Support Extras
You need to install language servers manually for these types of files.  

## LaTeX

    wget https://github.com/latex-lsp/texlab/releases
    tar -xvzf texlab-x86_64-linux.tar.gz
    mv texlab ~/.local/bin/

## Terraform
Get the language server latest release ([instructions](https://github.com/hashicorp/terraform-ls/blob/main/docs/installation.md#other-platforms)), then simply copy it to a local executable directory in your `$PATH`.  
- Mac: `~/Applications` (assuming `$HOME/Applications` is in the `$PATH`).
- Linux: `~/local` or equivalent
