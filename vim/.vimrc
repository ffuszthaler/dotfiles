"" VIM-PLUG
call plug#begin('~/.vim/plugged')
Plug 'dsolstad/vim-wombat256i'
Plug 'scrooloose/nerdtree'
Plug 'townk/vim-autoclose'
Plug 'ap/vim-css-color'
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'crater2150/vim-theme-chroma'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'

call plug#end()

"" PLUGIN SETTINGS
" Lightline
let g:lightline = {
      \'colorscheme': 'seoul256',
      \}

" NERDTree
map <C-n> :NERDTreeToggle<cr>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" NERD Commenter (important shortcuts)
" <leader>cc - Comment out current line or text selected in visual mode.
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
set laststatus=2
set number
set relativenumber
set wildmode=list:longest,full
set wildmenu
colorscheme chroma

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

" Deactivate Arrow Keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

