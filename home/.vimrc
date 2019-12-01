call plug#begin('~/.vim/plugged')
" Miscellaneous
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'

" File Management
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

" Color Themes
Plug 'xero/sourcerer.vim'
Plug 'xero/blaquemagick.vim'
Plug 'sjl/badwolf'
Plug 'balanceiskey/vim-framer-syntax'
Plug 'andreypopp/vim-colors-plain'

" Completion
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" General
syntax on
filetype plugin indent on
""set number
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
set splitbelow splitright
set background=dark
" colorscheme plain
set t_Co=256
set wildmenu
set nobackup
set scrolloff=10

" Display whitespace
set list
set listchars=
set listchars+=tab:·\
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:░

" Clear SignColumn for signify and else
highlight clear SignColumn

" Custom Statusline
source ~/.vim/statusline.vim

" RainbowParentheses
autocmd VimEnter * RainbowParentheses

" NERDTree
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['\.o$', '.ccls-cache']

" ALE
let g:ale_fixers={
  \ 'javascript': ['eslint']
  \}

" Ultisnips
let g:UltisnipsExpandTrigger="<tab>"
let g:UltisnipsEditSplit="vertical"

" Coc
let g:coc_global_extensions=[
  \ 'coc-snippets',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-eslint',
  \ 'coc-css',
  \ 'coc-rls',
  \]

" NERD Commenter
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'

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
nnoremap <leader>y :TagbarToggle<CR>
nnoremap <leader>x :terminal<CR>
nnoremap <leader>c :GFiles?<CR>
nnoremap <leader>v :Colors<CR>

" List and switch buffer
nnoremap <leader>l :ls<CR>:b<space>

" Coc
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)
