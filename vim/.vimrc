set nocompatible

" Map Leaders
let mapleader=","
let maplocalleader="\\"

execute pathogen#infect()

syntax on
colorscheme off
filetype plugin indent on

" Syntax
set showmatch
set synmaxcol=200

" Colors
set background=dark
set t_Co=256

" Basics
set encoding=utf-8
set showcmd
set laststatus=1
set number
set ruler
set display+=lastline
set scrolloff=10
set sidescrolloff=20
set sidescroll=1
set shortmess+=I
set title
set wildmenu
set autoread
set clipboard=unnamed
set ttimeoutlen=50

" Whitespace
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set shiftround
set autoindent
set smartindent
set cindent
set backspace=indent,eol,start

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Splits
set splitbelow
set splitright

" Temporary files
set undofile
set backupdir=~/.vim/tmp/backup
set directory=~/.vim/tmp/swap
set undodir=~/.vim/tmp/undo

" goimports
let g:go_fmt_command = "goimports"

" slime
let g:slime_target = "tmux"
