set nocompatible

" Map Leaders
let mapleader=","
let maplocalleader="\\"

execute pathogen#infect()

filetype plugin indent on
set autoindent

" Syntax
syntax enable
set showmatch
set synmaxcol=200

" Colors
set t_Co=256
set background=dark
colorscheme paramount
hi Normal ctermbg=none

" Basics
set encoding=utf-8
set showcmd
set noshowmode
set laststatus=2
set number
set ruler
set colorcolumn=80
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
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set shiftround
set autoindent
set smartindent
set cindent
set backspace=indent,eol,start

" Wrapping
set nowrap

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <silent> <CR> :nohlsearch<CR>i

" Folding
set foldmethod=indent
set foldlevelstart=2
nnoremap <Space> za
vnoremap <Space> za

" Splits
set splitbelow
set splitright

" Temporary files
set undofile
set backupdir=~/.vim/tmp/backup
set directory=~/.vim/tmp/swap
set undodir=~/.vim/tmp/undo

" Buffer switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Reset cursor on exit
autocmd VimLeave * set guicursor=n-v-c:block,o:hor50,i-ci:hor15,r-cr:hor30,sm:block

" Close all open buffers on entering a window if the only buffer
" that's left is NERDTree
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
             if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction

" goimports
let g:go_fmt_command = "goimports"

" vim-airline
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled=1
