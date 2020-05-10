" Basics
set encoding=utf-8
set clipboard=unnamed
set ignorecase
set smartcase
set hlsearch
set expandtab
set tabstop=4 shiftwidth=4
set mouse=a "enable mouse on all modes
set nowrap
set cursorline
set scrolloff=10
set autoread<
set incsearch "incremental search"
set inccommand=split "incremental commands, ex: substitute"
" set g=on for %s/find/replace/g,
" replaces all occurrances of the current line
set gdefault

" ESCape easily with
inoremap kj <ESC>
inoremap KJ <ESC>
inoremap <ESC> <Nop>

" Use j,k for navigating up/down wrapped text
nnoremap j gj
nnoremap k gk

" Set the Leader
let mapleader = ","

" Sourcing
:nnoremap <leader>so :source ~/.config/nvim/init.vim<CR>

" No swap files needed
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

