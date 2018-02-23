set nocompatible

let mapleader=","
let maplocalleader="\\"

execute pathogen#infect()

syntax on
colorscheme off
filetype plugin indent on

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set backupdir=~/.vim/tmp/backup
set cindent
set clipboard=unnamed
set colorcolumn=80
set directory=~/.vim/tmp/swap
set display+=lastline
set encoding=utf-8
set expandtab
set guicursor=
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set number
set rtp+=/usr/local/opt/fzf
set ruler
set scrolloff=10
set shiftround
set shiftwidth=4
set shortmess+=I
set showcmd
set showmatch
set sidescroll=1
set sidescrolloff=100
set smartcase
set smartindent
set smarttab
set softtabstop=4
set splitbelow
set splitright
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L
set synmaxcol=200
set t_Co=256
set tabstop=4
set textwidth=80
set title
set ttimeoutlen=50
set undodir=~/.vim/tmp/undo
set undofile
set wildmenu

" let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'down': '~50%' }
let g:go_fmt_command = "goimports"
let g:slime_target = "tmux"
let g:sneak#label = 1
let g:sneak#streak = 1

if has("autocmd")
  autocmd FileType c,cpp setlocal commentstring=//\ %s
  autocmd FileType gitcommit set colorcolumn=73
  autocmd FileType gitcommit set textwidth=73
  autocmd FileType js set shiftwidth=2
  autocmd FileType js set softtabstop=2
  autocmd FileType js set tabstop=2
endif

highlight ColorColumn ctermbg=236 guibg=#303030

noremap <leader>a =ip
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :Files<cr>
