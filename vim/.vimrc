"" VIM-PLUG
call plug#begin('~/.vim/plugged')
Plug 'dsolstad/vim-wombat256i'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'townk/vim-autoclose'
Plug 'ap/vim-css-color' 
Plug 'luochen1990/rainbow'
Plug 'edkolev/tmuxline.vim'
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'crater2150/vim-theme-chroma'


call plug#end()

"" PLUGIN SETTINGS
" Airline
let g:airline_theme='minimalist'

" Airline fix for tmux on WSL
call airline#parts#define_accent('mode', 'none')
call airline#parts#define_accent('linenr', 'none')
call airline#parts#define_accent('maxlinenr', 'none')

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Rainbow Parentheses
let g:rainbow_active = 1

" Tmuxline
let g:tmuxline_powerline_separators = 0

"" BASIC
filetype plugin indent on
set autoread
set nobackup
set encoding=utf-8
let mapleader=","

"" LOOK
syntax on
set background=dark
set t_Co=256
set number
set relativenumber
set wildmode=list:longest,full
set wildmenu
colorscheme chroma "desert

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

"" MAPPING
" Splits
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" Tabs
nnoremap <C-t> :tabnew<Space>
nnoremap tn :tabnext<Space>
nnoremap tp :tabprev<Space>
nnoremap tf :tabfirst<Space>
nnoremap tl :tablast<Space>
nnoremap tc :tabclose<Space>

" Fast saving
map <leader>w :w!<cr>

" Better search
map <space> /

" Deactivate Arrow Keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

