"" VIM-PLUG
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'w0rp/ale'
Plug 'mhinz/vim-signify'
Plug 'dylanaraps/wal.vim'
call plug#end()

"" PLUGIN SETTINGS
" NERDTree
map <C-n> :NERDTreeToggle<cr>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"" GENERAL
set nocompatible
filetype plugin indent on
set autoread
set nobackup
set encoding=utf-8
let mapleader=" "
set backspace=indent,eol,start
set splitbelow splitright
set wildmenu
set wildmode=list:longest,full

"" LOOK
syntax on
set background=dark
set t_Co=256
set ruler
set statusline=%F%m%r%h%w%=\ [%{&ff}]\ [%l,%v]\ [%p%%]\ [%L]
set number
set relativenumber
set colorcolumn=80
set cursorline
set showmatch
colorscheme wal

"" SEARCH
set ignorecase
set smartcase
set incsearch
set hlsearch

"" INDENTING
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent

"" GVIM
if has("gui_running")
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guioptions-=e
  set guioptions-=c
  set columns=100 lines=50
  colorscheme koehler
endif

"" MAPPING
" Copy/Paste from/to System Clipboard
vnoremap <C-c> "+y
map <C-v> "+p
