" Basics
set encoding=utf-8
set relativenumber
set clipboard=unnamed
set ignorecase
set smartcase
set incsearch
set hlsearch
set cursorline
set expandtab 
set tabstop=4 shiftwidth=4

" Set the Leader
let mapleader = ","

" Sourcing
:nnoremap <leader>so :source ~/.config/nvim/init.vim<CR>

" No swap files needed
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

" Window switching
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

#colorscheme=PaperColor
