" Basics
set encoding=utf-8
set clipboard=unnamed
set clipboard=unnamedplus
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
" No swap files needed
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

" line number and styling
set number
highlight LineNr ctermfg=darkgrey
highlight CursorLineNr ctermfg=grey

" ESCape easily with
inoremap kj <ESC>
inoremap KJ <ESC>
inoremap <ESC> <Nop>

" Use j,k for navigating up/down wrapped text
nnoremap j gj
nnoremap k gk

" Save
nnoremap <C-s> :write<CR>
inoremap <C-s> <ESC>:write<CR>


" Set the Leader
let mapleader = ","

" Sourcing
:nnoremap <leader>so :source ~/.config/nvim/init.vim<CR>

" Remove vertical splitbar
" \SPACE
:set fillchars+=vert:\|
