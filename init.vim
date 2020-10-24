set nocompatible

call plug#begin('~/.config/nvim/vim-plugs')
  " Color Schemes
  Plug 'danilo-augusto/vim-afterglow'
  Plug 'embark-theme/vim', { 'as': 'embark' }
  " Utilities
  Plug 'vim-syntastic/syntastic'
  " Rust
  Plug 'rust-lang/rust.vim'
  Plug 'racer-rust/vim-racer'
call plug#end()

" standard stuff
colorscheme afterglow 
syntax enable
filetype plugin indent on
set encoding=utf-8
set fileencoding=utf-8

" This if-block is useful on Mac, but looks bad with Arch+urxvt+i3wm
if (has('termguicolors'))
  set termguicolors
endif

set relativenumber
set nowrap
set colorcolumn=120

" tab trickery
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

