"" VIM-PLUG
"call plug#begin('~/.config/nvim/plugged')
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'ap/vim-css-color'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'yggdroot/indentline'
Plug 'mattn/emmet-vim'
call plug#end()

"" PLUGIN SETTINGS
" NERDTree (For help type ?)
map <C-n> :NERDTreeToggle<cr>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" BASIC
set nocompatible
filetype plugin indent on
set autoread
set nobackup
set encoding=utf-8
let mapleader=","
set updatetime=100
set backspace=indent,eol,start

"" LOOK
syntax on
set background=dark
set t_Co=256
set ruler
"set laststatus=2
set statusline=%F%m%r%h%w%=\ [%{&ff}]\ [%l,%v]\ [%p%%]\ [%L]
set number
set relativenumber
set wildmenu
set wildmode=list:longest,full
"colorscheme one
"set termguicolors
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

"" SEARCH
set ignorecase
set smartcase
set hlsearch
set showmatch

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
  "set guifont=furacode\ nerd\ font\ mono
  set columns=100 lines=25
  colorscheme koehler
endif

"" MAPPING
" Splits
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <leader>v :vsp<space>
map <leader>h :sp<space>

" Tabs
noremap <C-t> :tabnew<space>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Fast saving
map <leader>w :w!<cr>

" Better search
map <space> /

" Copy/Paste from/to System Clipboard
vnoremap <C-c> "+y
map <C-v> "+p

