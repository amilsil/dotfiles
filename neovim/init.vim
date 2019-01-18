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

" Tabs
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-c> :tabclose<CR>

colorscheme PaperColor
"
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Try to run vim-test tests on tmux
Plug 'benmills/vimux'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'vim-airline/vim-airline'

Plug 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|bin\|lib\'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'

" On-demand loading
Plug 'scrooloose/nerdtree' 
    noremap <leader>nf :NERDTreeFind<CR>
    noremap <leader>nt :NERDTreeToggle<CR>

" Syntastic
Plug 'scrooloose/syntastic'
    let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
    let g:syntastic_always_populate_loc_list = 1


" Git Fugitive
Plug 'tpope/vim-fugitive'
    :nnoremap <leader>gs :Gstatus<CR>

" Git status in the Gutter
Plug 'airblade/vim-gitgutter'

Plug 'prettier/vim-prettier', {
            \ 'do': 'npm install',
            \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" typescript syntax and formatting
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript' }
    augroup typescript
      let g:tsuquyomi_single_quote_import=1
      autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
      autocmd FileType typescript nmap <buffer> <Leader>i <Plug>(TsuquyomiImport)
      autocmd FileType typescript nmap <buffer> <Leader>d <Plug>(TsuDefinition)
    augroup END

" Html Math Tags
Plug 'valloric/matchtagalways'

" Initialize plugin system
call plug#end()
