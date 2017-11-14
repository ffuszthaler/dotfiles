set nocompatible
syntax on


" Vundle begins here; turn off filetype temporarily
" set the runtime path to include Vundle and initialize
	filetype off
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

" Plugins
	Plugin 'scrooloose/nerdtree'
	Plugin 'tpope/vim-fugitive'
	Plugin 'scrooloose/syntastic'
	Plugin 'ctrlpvim/ctrlp.vim'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'mattn/emmet-vim'
	Plugin 'flazz/vim-colorschemes'
	Plugin 'airblade/vim-gitgutter'

" let Vundle manage Vundle, required
	Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype plugin indent on


set term=screen-256color
colorscheme molokai

let python_highlight_all=1

" Basic settings
	set autoindent
	set bg=dark
	set backspace=indent,eol,start
	set expandtab
	set ignorecase
	set smartcase
	set incsearch
	set laststatus=2
	set linebreak
	set nobackup
	set noswapfile
	set noerrorbells
	set nolist
	set novb
	set nowrap
	set number
	set relativenumber
	set ruler
	set scrolloff=8
	set showmatch
	set shiftwidth=4
	set shortmess=I
	set showmode
	set sidescroll=1
	set sidescrolloff=7
	set softtabstop=4
	set undolevels=1000

" Gvim mods
	set encoding=utf-8
	set hidden
	set history=100
	set mouse=a
	set guioptions-=m
	set guioptions-=T
	set guioptions-=r
	set guioptions-=Lo

" Black stripe after 80 characters
	highlight ColorColumn ctermbg=black
	set colorcolumn=80


" Airline general settings
	let g:airline_theme='tomorrow'
	let g:airline_powerline_fonts = 1

	if !exists('g:airline_symbols')
    	let g:airline_symbols = {}
	endif

	let g:Powerline_symbols = "fancy"
	let g:Powerline_dividers_override = ["\Ue0b0","\Ue0b1","\Ue0b2","\Ue0b3"]
	let g:Powerline_symbols_override = {'BRANCH': "\Ue0a0", 'LINE': "\Ue0a1", 'RO': "\Ue0a2"}
	let g:airline_powerline_fonts = 1
	let g:airline_powerline_fonts = 1
	let g:airline_right_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_left_alt_sep= ''
	let g:airline_left_sep = ''

" Unicode symbols
	let g:airline_left_sep = '»'
	let g:airline_left_sep = '▶'
	let g:airline_right_sep = '«'
	let g:airline_right_sep = '◀'
	let g:airline_symbols.linenr = '␊'
	let g:airline_symbols.linenr = '␤'
	let g:airline_symbols.linenr = '¶'
	let g:airline_symbols.branch = '⎇'
	let g:airline_symbols.paste = 'ρ'
	let g:airline_symbols.paste = 'Þ'
	let g:airline_symbols.paste = '∥'
	let g:airline_symbols.whitespace = 'Ξ'

" Airline symbols
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.branch = ''
	let g:airline_symbols.readonly = ''
	let g:airline_symbols.linenr = ''

" NERDTree
	map <F12> :NERDTreeToggle<CR>

	"nerd-commenter settings
	" Add spaces after comment delimiters by default
	let g:NERDSpaceDelims = 1

	"Use compact syntax for prettified multi-line comments
	let g:NERDCompactSexyComs = 1

	"Align line-wise comment delimiters flush left instead of following code
	"indentation
	let g:NERDDefaultAlign = 'left'

	"Allow commenting and inverting empty lines (useful when commenting a
	"region)
	let g:NERDCommentEmptyLines = 1

	"Enable trimming of trailing whitespace when uncommenting
	let g:NERDTrimTrailingWhitespace = 1


" Key mappings

	"CtrlP
	let g:ctrlp_map = '<c-p>'

	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-h> <C-w>h
	nnoremap <C-l> <C-w>l

	"Tab stuff
	nnoremap tn :tabnew<cr>
	nnoremap tk :tabnext<cr>
	nnoremap tj :tabprev<cr>
	nnoremap th :tabfirst<cr>
	nnoremap tl :tablast<cr>

	" Remove all trailing whitespace by pressing F4
	noremap <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>


if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata\ for\ Powerline\ Medium\ 16
        colorscheme iceberg
    endif
endif
