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
Plug 'liuchengxu/vim-clap'
Plug 'kassio/neoterm'

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
colorscheme iceberg
set t_Co=256
set termguicolors
set scrolloff=10
set colorcolumn=80
set cursorline
set cursorcolumn
set updatetime=100

" Clear SignColumn for signify and else
" highlight clear SignColumn

" Helper
function! CreateCenteredFloatingWindow()
    let width = float2nr(&columns * 0.6)
    let height = float2nr(&lines * 0.6)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

function! OpenTerm(cmd)
    call CreateCenteredFloatingWindow()
    call termopen(a:cmd, { 'on_exit': function('OnTermExit') })
endfunction

function! OnTermExit(job_id, code, event) dict
    if a:code == 0
        bd!
    endif
endfunction

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
  \ 'colorscheme': 'iceberg',
  \ 'separator': { 'left': "\ue0b8", 'right': "\ue0ba" },
  \ 'subseparator': { 'left': "\ue0b9", 'right': "\ue0bb" },
  \ 'tabline_separator': { 'left': "\ue0bc", 'right': "\ue0be" },
  \ 'tabline_subseparator': { 'left': "\ue0bd", 'right': "\ue0bf" },
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
let g:UltisnipsExpandTrigger = "<tab>"
let g:UltisnipsEditSplit = "vertical"

" The NERD Commenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" RainbowParentheses
autocmd VimEnter * RainbowParentheses

" Vista
autocmd BufEnter * if winnr("$") == 1 && vista#sidebar#IsVisible() | execute "normal! :q!\<CR>" | endif

" signify
let g:signify_line_highlight = 1
let g:signify_sign_show_count = 1
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '!'

" indentLine
let g:indentLine_enabled = '1'
" Different line types: | ¦ ┆ │
" let g:indentLine_char='│'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_leadingSpaceChar='▸'
" let g:indentLine_leadingSpaceEnabled='1'

" Lazygit
function! OpenLazyGit()
    call OpenTerm('lazygit')
    startinsert
endfunction

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
" nnoremap <leader>v :Colors<CR>
nnoremap <leader>v :Clap colors<CR>

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

" Lazygit
nnoremap <silent> <leader># :call OpenLazyGit()<CR>
