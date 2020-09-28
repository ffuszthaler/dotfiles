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
Plug 'junegunn/goyo.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'liuchengxu/vim-clap'
Plug 'mhinz/vim-startify'
Plug 'junegunn/limelight.vim'

" File Management
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Statusline & Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'edkolev/tmuxline.vim'
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
set showtabline=2
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
  \ 'coc-json',
  \ 'coc-eslint',
  \ 'coc-css',
  \ 'coc-rls',
  \ 'coc-python',
  \]
let g:coc_status_warning_sign = "\uf071 "
let g:coc_status_error_sign = "\uf188 "

" Lightline
function! FileIcon()
  return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! FiletypeIcon()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! FileformatIcon()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

let g:lightline = {
  \ 'colorscheme': 'codedark',
  \ 'separator': { 'left': "\ue0b8", 'right': "\ue0ba" },
  \ 'subseparator': { 'left': "\ue0b9", 'right': "\ue0bb" },
  \ 'tabline_separator': { 'left': "\ue0bc", 'right': "\ue0be" },
  \ 'tabline_subseparator': { 'left': "\ue0bd", 'right': "\ue0bf" },
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
  \   'fileicon': 'FileIcon',
  \   'filetype': 'FiletypeIcon',
  \   'fileformat': 'FileformatIcon',
  \   'cocstatus': 'coc#status',
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
  \ 'mode_map': {
  \   'n'      : 'N',
  \   'no'     : 'N·Operator Pending',
  \   'v'      : 'V',
  \   'V'      : 'V·Line',
  \   "\<C-V>" : 'V·Block',
  \   's'      : 'Select',
  \   'S'      : 'S·Line',
  \   "\<C-S>" : 'S·Block',
  \   'i'      : "\uf0e7",
  \   'R'      : 'R',
  \   'Rv'     : 'V·Replace',
  \   'c'      : 'C',
  \   'cv'     : 'Vim Ex',
  \   'ce'     : 'Ex',
  \   'r'      : 'Prompt',
  \   'rm'     : 'More',
  \   'r?'     : 'Confirm',
  \   '!'      : 'Shell',
  \   't'      : 'Terminal'
  \ },
  \ }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c"

" ALE
let g:ale_open_list = 1
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END
let g:ale_sign_error = "\uf05e"
let g:ale_sign_warning = "\uf071"
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

" Ultisnips
let g:UltisnipsExpandTrigger = "<tab>"
let g:UltisnipsEditSplit = "vertical"

" The NERD Commenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

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
nnoremap <leader>v :Clap colors<CR>

" List and switch buffer
nnoremap <leader>l :ls<CR>:b<space>

" Toggle line numbers
nnoremap <silent> <C-l> :set number!<CR>

" Toggle background
map <silent> <leader>bg :let &background = ( &background == "dark" ? "light" : "dark" )<CR>

" Coc
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)
nmap <silent> <leader>dh <Plug>(coc-doHover)

" Fugitive
nmap <silent> <leader>gs :Gstatus<CR>
nmap <leader>ge :Gedit<CR>
nmap <silent><leader>gr :Gread<CR>
nmap <silent><leader>gb :Gblame<CR>
