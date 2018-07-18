"" VIM-PLUG
call plug#begin('~/.vim/plugged')
Plug 'dsolstad/vim-wombat256i'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'townk/vim-autoclose'
Plug 'ap/vim-css-color'
Plug 'luochen1990/rainbow'
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'crater2150/vim-theme-chroma'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

call plug#end()

"" PLUGIN SETTINGS
" Airline
let g:airline_theme='minimalist'

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Rainbow Parentheses
let g:rainbow_active = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" NERD Commenter (important shortcuts)
" <leader>cc - Comment aout current line or text selected in visual mode.
" <leader>cu - Uncomment the selected line(s).

" Surround.vim (", ' , ... are just used for example)
" cs"' - to change "Hello" to 'Hello'
" cs'<tagname> - to change 'Hello' to <tagname>Hello</tagname>
" cst" - to get "Hello" again
" ds" - to remove delimiters entirely

"" BASIC
set nocompatible
filetype plugin indent on
set autoread
set nobackup
set encoding=utf-8
let mapleader=","
set updatetime=100

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

