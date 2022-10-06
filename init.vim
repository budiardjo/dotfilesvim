set mouse=a
set title
set relativenumber
set number
set autoindent
set ignorecase
set expandtab
set tabstop=4
set shiftwidth=4

syntax enable
inoremap jk <esc>

call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'

" Colorscheme
Plug 'joshdick/onedark.vim'

" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" LSP Setup
Plug 'VonHeikemen/lsp-zero.nvim'

call plug#end()

" setting for lightline 
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif

" setting for NERDTREE

nnoremap <C-b> :NERDTreeToggle<CR>
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

set signcolumn=yes

" setting for lsp

try
  set signcolumn=yes
  set termguicolors
  colorscheme onedark
catch
  " do nothing
endtry

lua <<EOF
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()
EOF
