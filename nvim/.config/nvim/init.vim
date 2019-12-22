call plug#begin('~/.local/share/nvim/plugged')
" Miscellaneous
Plug 'Yggdroot/indentLine'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'liuchengxu/vista.vim'
Plug 'junegunn/goyo.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'liuchengxu/vim-clap' " :Clap colors
Plug 'kassio/neoterm'

" File Management
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Statusline & Icons
" Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'edkolev/tmuxline.vim'
" TESTING - might use this over airline
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
" TESTING

" Completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'

" Color Themes
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'fenetikm/falcon'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'KabbAmine/yowish.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'xero/blaquemagick.vim'
Plug 'xero/sourcerer.vim'
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'Rigellute/rigel'
Plug 'andreypopp/vim-colors-plain'
Plug 'tek256/simple-dark'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'mhartington/oceanic-next'
Plug 'flrnd/plastic.vim'
Plug 'rainglow/vim', { 'as': 'rainglow' }
Plug 'joshdick/onedark.vim'
Plug 'liuchengxu/space-vim-theme'
Plug 'haishanh/night-owl.vim'
Plug 'conweller/endarkened.vim'
call plug#end()

" General
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
colorscheme endarkened
set t_Co=256
set termguicolors
set scrolloff=10
" set colorcolumn=80
set cursorline
" set cursorcolumn

" Clear SignColumn for signify and else
highlight clear SignColumn

" Coc
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-eslint',
  \ 'coc-css',
  \ 'coc-rls',
  \ 'coc-python',
  \]

" Airline
" let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
" let g:airline_left_sep="\ue0bc"
" let g:airline_right_sep="\ue0ba"
" let g:airline_left_alt_sep="\ue0bd"
" let g:airline_right_alt_sep="\ue0bb"
let g:airline_left_sep="▓▒░"
let g:airline_right_sep="░▒▓"

" Lightline
function! FiletypeIcon()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! FileformatIcon()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

  " 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
  " 'subseparator': { 'left': '|', 'right': '|' },
let g:lightline = {
      \ 'colorscheme': 'endarkened',
  \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'method' ] ],
  \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
  \              [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \   'filetype': 'FiletypeIcon',
  \   'fileformat': 'FileformatIcon',
  \   'cocstatus': 'coc#status',
  \   'method': 'NearestMethodOrFunction',
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
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

" ALE
let g:ale_sign_error="\uf05e"
let g:ale_sign_warning="\uf071"
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'cpp': ['clang-format'],
  \ 'c': ['clang-format'],
  \ }

" NERDTree
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['\.o$', '.ccls-cache']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeIndicatorMapCustom = {
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
let g:UltisnipsExpandTrigger="<tab>"
let g:UltisnipsEditSplit="vertical"

" The NERD Commenter
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'

" RainbowParentheses
autocmd VimEnter * RainbowParentheses

" indentLine
let g:indentLine_enabled='1'
" | ¦ ┆ │
" let g:indentLine_char='│'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_leadingSpaceChar='▸'
" let g:indentLine_leadingSpaceEnabled='1'

" Mappings
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
nnoremap <leader>y :Vista!!<CR>
nnoremap <leader>x :10split term://bash<CR>
nnoremap <leader>c :GFiles?<CR>
nnoremap <leader>v :Colors<CR>

" List and switch buffer
nnoremap <leader>l :ls<CR>:b<space>

" Toggle line numbers
nnoremap <silent> <C-l> :set number!<CR>

" Toggle background
map <silent> <leader>bg :let &background = ( &background == "dark" ? "light" : "dark" )<CR>

" Terminal
" escape terminal
tnoremap <C-space> <C-\><C-n><esc><CR>
" Neoterm
" toggle terminal
nnoremap <silent> <C-o> :vertical botright Ttoggle<CR><C-w>l
nnoremap <silent> <C-p> :botright Ttoggle<CR><C-w>j
" close terminal
tnoremap <silent> <C-o> <C-\><C-n>:Ttoggle<CR>
tnoremap <silent> <C-p> <C-\><C-n>:Ttoggle<CR>

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
