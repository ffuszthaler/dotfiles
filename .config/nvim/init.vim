call plug#begin('~/.local/share/nvim/plugged')
" Miscellaneous
Plug 'Yggdroot/indentLine'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'

" File icons
Plug 'ryanoasis/vim-devicons'

" File management
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'

" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'fenetikm/falcon'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'KabbAmine/yowish.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'flazz/vim-colorschemes'
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
call plug#end()

" General
syntax on
filetype plugin indent on
set number relativenumber
set laststatus=2
set autoindent
set hlsearch
set ruler
set clipboard^=unnamed,unnamedplus
set expandtab
set shiftwidth=2
set tabstop=2
let mapleader=" "
set encoding=UTF-8
set autoread
set list
set splitbelow splitright
set background=dark
colorscheme falcon
set termguicolors
set scrolloff=10
set colorcolumn=80

" Airline
" other cool characters: '░'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_left_sep="\ue0b8"
let g:airline_right_sep="\ue0ba"
" let g:airline_theme='minimalist'

" ALE
" other cool characters:
" '⚡' '✗' '➽' '⚑' '⚐'
" '♒' '⛢' '❕' '❗'
let g:ale_sign_error='✗'
let g:ale_sign_warning='⚠'
let g:ale_fixers = {
\ 'javascript': ['eslint']
\ }
" let g:ale_fix_on_save = 1

" Deoplete
let g:deoplete#enable_at_startup=1

" NERDTree
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1

" Ultisnips
let g:UltisnipsExpandTrigger="<tab>"
let g:UltisnipsEditSplit="vertical"

" The NERD Commenter
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'

au VimEnter * RainbowParentheses

" Mappings
"inoremap jk <Esc>
tnoremap <Esc> <C-\><C-n>:q<CR>
"nnoremap <F1> <CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :ALEDetail<CR>
nnoremap <F4> :Colors<CR>
nnoremap <F5> :Files<CR>
nnoremap <F6> :Buffers<CR>
nnoremap <F7> :GFiles?<CR>
nnoremap <F8> :Commits<CR>
nnoremap <F9> :TagbarToggle<CR>
nnoremap <F10> :Tags<CR>
nnoremap <F11> :%s/\s\+$//e<CR>
nnoremap <F12> :10split term://bash<CR>
nnoremap <leader>w :w !sudo tee %<CR>
nnoremap <leader>f :ALEFix<CR>
