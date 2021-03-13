" init.vim, @ffuszthaler

""" PLUGINS
call plug#begin('~/.local/share/nvim/plugged')
" Miscellaneous
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" File Management
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'

" Statusline
Plug 'itchyny/lightline.vim'

" Color Themes
Plug 'tomasiser/vim-code-dark'
call plug#end()

""" GENERAL
set nocompatible
syntax on
filetype plugin indent on
set number
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
colorscheme codedark
set t_Co=256
set termguicolors
set scrolloff=10
set colorcolumn=80
set cursorline
set updatetime=100

" Clear SignColumn
highlight clear SignColumn

""" PLUGIN SETTINGS
" coc.nvim
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-rls',
  \ 'coc-python',
  \]

" Lightline
let g:lightline = {
  \ 'colorscheme': 'codedark',
  \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
  \ 'subseparator': { 'left': '|', 'right': '|' },
  \ 'tabline_separator': { 'left': '▓▒░', 'right': '░▒▓' },
  \ 'tabline_subseparator': { 'left': '|', 'right': '|' },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'cocstatus' ],
  \              [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \   'cocstatus': 'coc#status'
  \ },
  \ 'tabline': {
  \   'left': [ [ 'tabs' ] ],
  \   'right': [ [ 'close' ] ]
  \ },
  \ 'tab': {
  \   'active': [ 'filename', 'modified' ],
  \   'inactive': [ 'filename', 'modified' ]
  \ },
  \ }

" NERD Commenter
let g:NERDSpaceDelims = 1

"Startify
let g:startify_change_to_dir = 1
let g:startify_files_number = 5
let g:startify_lists = [
  \ { 'type': 'dir',       'header': ['   Recent files'] },
  \ { 'type': 'sessions',  'header': ['   Saved sessions'] },
  \ ]
let g:startify_custom_header = [
  \ '',
  \ '   ┏┓╻   ╻ ╻   ╻   ┏┳┓',
  \ '   ┃┃┃   ┃┏┛   ┃   ┃┃┃',
  \ '   ╹┗┛   ┗┛    ╹   ╹ ╹',
  \ ''
  \ ]

""" KEYBOARD MAPPINGS
" 1st Row
nnoremap <leader>q :Buffers<CR>
nnoremap <leader>w :w !sudo tee %<CR>
nnoremap <leader>e :CocList<CR>
nnoremap <leader>r :%s/\s\+$//e<CR>

" 2nd Row
nnoremap <leader>a :Files<CR>
" nnoremap <leader>s
" nnoremap <leader>d
" nnoremap <leader>f

" 3rd Row
nnoremap <leader>y :Limelight!!<CR>
nnoremap <leader>x :Goyo<CR>
nnoremap <leader>c :GFiles?<CR>
nnoremap <leader>v :Colors<CR>

" Toggle line numbers
nnoremap <silent> <C-l> :set number!<CR>

" Fugitive
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gd :Gdiffsplit<CR>

" coc.nvim
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>di <Plug>(coc-implementation)
nmap <silent> <leader>dh <Plug>(coc-doHover)
