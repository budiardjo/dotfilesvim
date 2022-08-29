set mouse=a
set title
set relativenumber
set number
set autoindent
set ignorecase
set expandtab
set tabstop=4
set shiftwidth=4

" seting backspace as a normal developer
set backspace=indent,eol,start

" setting ctrl a and ctrl c as a normal person, blazigly fast
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


" seting escape mode for a good sake
inoremap jk <esc> 

" setting autozimu 
" Remove 'tag' type from c-n completion. Call it explicitly via mucomplete instead.
set complete=.,w,b,u,k
set completeopt=menuone,noselect
" Shut off completion messages
set shortmess+=c

let g:LanguageClient_serverCommands = {
    \ 'cpp': ['/usr/bin/clangd'],
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }

let g:mucomplete#force_manual = 1
let g:mucomplete#enable_auto_at_startup = 1

" setting for cpp highlight


let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1

" setting rust vim
let g:rustfmt_autosave = 1

