set encoding=utf-8
set clipboard=unnamed
set clipboard=unnamedplus
set ignorecase
set smartcase
set hlsearch
set expandtab
set tabstop=2 shiftwidth=2
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

" Use j,k for navigating up/down wrapped text
nnoremap j gj
nnoremap k gk

" Save
nnoremap <C-s> :write<CR>
inoremap <C-s> <ESC>:write<CR>

" Use treesitter folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.
