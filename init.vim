set nocompatible

call plug#begin('~/.config/nvim/vim-plugs')
  " Color Schemes
  Plug 'danilo-augusto/vim-afterglow'
  Plug 'embark-theme/vim', { 'as': 'embark' }
  Plug 'morhetz/gruvbox'
  " Utilities
  Plug 'vim-syntastic/syntastic'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " Plug '/usr/local/opt/fzf'  " fzf = fuzzy finder; used for matching file names
  Plug 'dense-analysis/ale' " lint runner
  " Javascript-family
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'HerringtonDarkholme/yats.vim' " reqd for nvim-typescript
  Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
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

" Create this file on your local machine (it is ignored in the repo).
" Put the paths to your python/ruby/node global installs there.
" (On OSX, default python doesn't come bundled with pip, so installing
" neovim connector package can't be done unless you install python some
" other way, like with Brew).
" Example lines to put in there:
" let g:python3_host_prog='/usr/local/Cellar/python@3.9/3.9.0_1/bin'
source $HOME/.config/nvim/local.vim

