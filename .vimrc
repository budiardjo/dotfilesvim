set mouse=a
set title
set relativenumber
set number
set autoindent
set ignorecase
set expandtab
set tabstop=4
set shiftwidth=4

" seting backspace 
set backspace=indent,eol,start

noremap <C-a> ggVG
noremap <C-c> "+y

syntax enable
filetype plugin indent on
" setting vim plug

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

Plug 'lifepillar/vim-mucomplete'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

" syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" rust vim
Plug 'rust-lang/rust.vim'
call plug#end()

"setting nerd tree

nnoremap <C-b> :NERDTreeToggle<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


