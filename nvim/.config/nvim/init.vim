" init.vim, @ffuszthaler

""" PLUGINS
call plug#begin('~/.local/share/nvim/plugged')
" Miscellaneous
Plug 'Yggdroot/indentLine'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" File Management
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Statusline
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" Completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'

" Color Themes
Plug 'tomasiser/vim-code-dark'
call plug#end()

""" GENERAL
set nocompatible
syntax on
filetype plugin indent on
" set number
set laststatus=2
" set showtabline=2
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
  \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
  \              [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \ },
  \ 'component_expand': {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \ },
  \ 'component_type': {
  \   'linter_checking': 'left',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left',
  \ },
  \ 'tabline': {
  \   'left': [ [ 'tabs' ] ],
  \   'right': [ [ 'close' ] ]
  \ },
  \ 'tab': {
  \   'active': [ 'filename', 'modified' ],
  \   'inactive': [ 'filename', 'modified' ],
  \ },
  \ }

" ALE
let g:ale_open_list = 1
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'cpp': ['clang-format'],
  \ 'c': ['clang-format'],
  \ }

" NERDTree
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore=['\.o$', '.ccls-cache']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeGitStatusIndicatorMapCustom = {
  \ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ "Ignored"   : "☒",
  \ "Unknown"   : "?"
  \ }

" NERD Commenter
let g:NERDSpaceDelims = 1

" RainbowParentheses
autocmd VimEnter * RainbowParentheses

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
nnoremap <leader>a :NERDTreeToggle<CR>
nnoremap <leader>s :ALEDetail<CR>
nnoremap <leader>d :ALEFix<CR>
nnoremap <leader>f :Files<CR>

" 3rd Row
nnoremap <leader>y :Limelight!!<CR>
nnoremap <leader>x :Goyo<CR>
nnoremap <leader>c :GFiles?<CR>
nnoremap <leader>v :Colors<CR>

" Toggle line numbers
nnoremap <silent> <C-l> :set number!<CR>

" coc.nvim
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>di <Plug>(coc-implementation)
nmap <silent> <leader>dh <Plug>(coc-doHover)

" Fugitive
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gd :Gdiffsplit<CR>
