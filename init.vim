set nocompatible
filetype off

call plug#begin('~/.config/nvim/vim-plugs')
  " Color Schemes
  Plug 'danilo-augusto/vim-afterglow'
  Plug 'embark-theme/vim', { 'as': 'embark' }
  Plug 'morhetz/gruvbox'
  " Utilities
  Plug 'ctrlpvim/ctrlp.vim'
  " Plug 'ludovicchabant/vim-gutentags' "havent got this to work just yet.
  Plug 'vim-syntastic/syntastic'
  " Plug 'dense-analysis/ale' "lint runner; superseded by coc (see below)
  " Javascript-family
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'HerringtonDarkholme/yats.vim' "reqd for nvim-typescript
  Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
  Plug 'neoclide/coc.nvim', {'branch': 'release'}  " for generic TLS-server languages
  " Rust
  Plug 'rust-lang/rust.vim'
  Plug 'racer-rust/vim-racer'
call plug#end()
filetype plugin indent on

" leader key is the one in normal mode that enables things like window switch.
" Normally the leader key is ctrl.
" let mapleader = ' '

" standard stuff
colorscheme afterglow 
syntax enable
set encoding=utf-8
set fileencoding=utf-8
set background=dark

" This if-block is useful on Mac, but looks bad with Arch+urxvt+i3wm
if (has('termguicolors'))
  set termguicolors
endif

" editor terrain
set relativenumber
set nowrap
set colorcolumn=120
set ruler
set nohlsearch " Don't highlight search term
set lazyredraw
set updatetime=300 "affects coc context pop-ups

" tab trickery
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Create this file on your local machine (it is ignored in the repo).
" Put the paths to your python/ruby/node global installs there.
" (On OSX, default python doesn't come bundled with pip, so installing
" neovim connector package can't be done unless you install python some
" other way, like with Brew).
" Example lines to put in there:
" let g:python3_host_prog='/usr/local/Cellar/python@3.9/3.9.0_1/bin'
source $HOME/.config/nvim/local.vim

