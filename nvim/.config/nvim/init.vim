" init.vim, @ffuszthaler

""" PLUGINS
call plug#begin('~/.local/share/nvim/plugged')
" Miscellaneous
Plug 'mhinz/vim-signify'
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" File Management
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Completion
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'folke/trouble.nvim'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdcommenter'

" UI
Plug 'romgrk/barbar.nvim'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'tomasiser/vim-code-dark'
Plug 'ray-x/aurora'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

""" GENERAL
set nocompatible
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
colorscheme aurora
set t_Co=256
set termguicolors
set scrolloff=10
set colorcolumn=80
set cursorline
set updatetime=100

" Clear SignColumn
highlight clear SignColumn

""" PLUGIN SETTINGS
" nvim-treesitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" nvim-tree.lua
let g:nvim_tree_auto_close = 1

" nvim-lspconfig
lua << EOF
vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}

require'lspconfig'.ccls.setup{}
require'lspconfig'.tsserver.setup{}
EOF

" lspsaga.nvim
lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga()
EOF

" galaxyline.nvim
lua << EOF
local gl = require('galaxyline')
--local colors = require('galaxyline.theme').default

local colors = {
  bg = '#20232800', --with transparency
  fg = '#bbc2cf',
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef';
  red = '#ec5f67';
}

local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui','packer'}

gls.left[1] = {
  RainbowRed = {
    --provider = function() return '▊ ' end,
    provider = function() return '▎' end,
    highlight = {colors.blue,colors.bg}
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {n = colors.red, i = colors.green,v=colors.blue,
                          [''] = colors.blue,V=colors.blue,
                          c = colors.magenta,no = colors.red,s = colors.orange,
                          S=colors.orange,[''] = colors.orange,
                          ic = colors.yellow,R = colors.violet,Rv = colors.violet,
                          cv = colors.red,ce=colors.red, r = colors.cyan,
                          rm = colors.cyan, ['r?'] = colors.cyan,
                          ['!']  = colors.red,t = colors.red}
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      return '  '
    end,
    highlight = {colors.red,colors.bg,'bold'},
  },
}
gls.left[3] = {
  FileSize = {
    provider = 'FileSize',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg}
  }
}
gls.left[4] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  },
}

gls.left[5] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.magenta,colors.bg,'bold'}
  }
}

gls.left[6] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg},
  },
}

gls.left[7] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg,'bold'},
  }
}

gls.left[8] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.left[9] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.left[10] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.cyan,colors.bg},
  }
}

gls.left[11] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
}

--[[gls.mid[1] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function ()
      local tbl = {['dashboard'] = true,['']=true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = ' LSP:',
    highlight = {colors.cyan,colors.bg,'bold'}
  }
}--]]

gls.right[1] = {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg,'bold'}
  }
}

gls.right[2] = {
  FileFormat = {
    provider = 'FileFormat',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg,'bold'}
  }
}

gls.right[3] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.violet,colors.bg,'bold'},
  }
}

gls.right[4] = {
  GitBranch = {
    provider = 'GitBranch',
    condtion = require("galaxyline.provider_vcs").check_git_workspace,
    highlight = {colors.violet,colors.bg,'bold'},
  }
}

gls.right[5] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = "   ",
    highlight = {colors.green,colors.bg},
  }
}
gls.right[6] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon= "   ",
    highlight = {colors.orange,colors.bg},
  }
}
gls.right[7] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon= "   ",
    highlight = {colors.red,colors.bg},
  }
}

gls.right[8] = {
  ScrollBar = {
    provider = "ScrollBar",
    separator = " ",
    condition = checkwidth,
    highlight = {colors.blue, colors.purple}
  }
}

--[[gls.right[8] = {
  RainbowBlue = {
    provider = function() return ' ▊' end,
    highlight = {colors.blue,colors.bg}
  },
}]]--

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
}
EOF

" NERD Commenter
let g:NERDSpaceDelims = 1

""" KEYBOARD MAPPINGS
" Random
nnoremap <leader>a :NvimTreeToggle<CR>

nnoremap <leader>s :TroubleToggle<CR>

" lspsaga.nvim
nnoremap <leader>q :Lspsaga show_line_diagnostics<CR>
nnoremap <leader>e :Lspsaga code_action<CR>
nnoremap <leader>t :Lspsaga diagnostic_jump_next<CR>
nnoremap <leader>z :Lspsaga diagnostic_jump_prev<CR>

nnoremap <leader>y :Limelight!!<CR>
nnoremap <leader>x :Goyo<CR>

nmap <silent> <leader>gs :Git<CR>
nmap <silent> <leader>gd :Gdiffsplit<CR>

" nvim-lspconfig
nmap <silent> <leader>dd <cmd>lua vim.lsp.buf.definition()<CR>
nmap <silent> <leader>dr <cmd>lua vim.lsp.buf.references()<CR>
nmap <silent> <leader>di <cmd>lua vim.lsp.buf.implementation()<CR>
nmap <silent> <leader>dh <cmd>lua vim.lsp.buf.hover()<CR>
nmap <silent> <leader>dl <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
