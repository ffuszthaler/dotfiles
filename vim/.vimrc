"" VIM-PLUG
"call plug#begin('~/.config/nvim/plugged')
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'ap/vim-css-color'
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'crater2150/vim-theme-chroma'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
"Plug 'itchyny/lightline.vim'
Plug 'rakr/vim-one'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'raimondi/delimitmate'
Plug 'yggdroot/indentline'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'whatyouhide/vim-gotham'
call plug#end()

"" PLUGIN SETTINGS
" Lightline
let g:lightline = {
      \'colorscheme': 'one',
      \}

" NERDTree
map <C-n> :NERDTreeToggle<cr>
let NERDTreeQuitOnOpen = 1

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
"set laststatus=2
set number
set relativenumber
set wildmode=list:longest,full
set wildmenu
"colorscheme one
"set termguicolors

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

"" GVIM (vim-plug needs to be in ~/vimfiles/autoload instead ~/.vim/autoload for windows) 
if has("gui_running")
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guioptions-=e
  set guioptions-=c
  set guifont=Consolas:h10 " default font of cmd
  set columns=100 lines=25
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

