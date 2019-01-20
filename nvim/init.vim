set nocompatible
set number
set relativenumber
set clipboard=unnamed
syntax on
filetype plugin on

" No swap files needed
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

" TODO: Pick a leader key
let mapleader = ","

" live replacing
set inccommand=nosplit

" Security
set modelines=0

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" --- PACKAGES ---------
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Common between langs
Plug 'junegunn/vim-easy-align'
" Surround
Plug 'tpope/vim-surround'
" Highlight yanks
Plug 'machakann/vim-highlightedyank'
" Autoformat
Plug 'chiel92/vim-autoformat'
" Git
Plug 'tpope/vim-fugitive'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'ervandew/supertab'
" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Commenter
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

" Air Line & Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" splitjoin for go
Plug 'AndrewRadev/splitjoin.vim'

" ctrlp filters lists
Plug 'ctrlpvim/ctrlp.vim'
    noremap <leader>l :CtrlP<CR>
    noremap <leader>b :CtrlPBuffer<CR>
    let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|bin\|lib\'

" Templates
Plug 'mhartington/oceanic-next'
Plug 'altercation/vim-colors-solarized'
Plug 'trevordmiller/nova-vim'
" Command T for quick file navigation
Plug 'wincent/command-t'
" You complete me, completion engine
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" emmet for vim
Plug 'mattn/emmet-vim'
" typescript syntax and formatting
Plug 'leafgarland/typescript-vim'
"vimproc is required for Tsuquyomi for typescript
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Typescript stuff
Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript' }
" asynchronous linting
Plug 'neomake/neomake'
" Dotnet Stuff
Plug 'OmniSharp/omnisharp-vim'
" Syntastic
Plug 'scrooloose/syntastic'

" Initialize plugin system
call plug#end()

" Color scheme (terminal)
set t_Co=256
set background=dark
syntax enable
set termguicolors
colorscheme PaperColor

" Global Plugin Config
noremap <leader>f :Autoformat<CR>
noremap <leader>nf :NERDTreeFind<CR>
noremap <leader>nt :NERDTreeToggle<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-c> :tabclose<CR>

" Ultisnips configuration to work with completion using Supertab
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetsDir = "~/.config/nvim/snips"
"let g:UltiSnipsSnippetDirectories=["snips"]
let g:UltiSnipsSnippetDirectories = ['~/.vim/plugged/UltiSnips', 'UltiSnips', 'snips']
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

augroup golang
  let g:deoplete#enable_at_startup = 1
  let g:go_auto_type_info = 1
  let g:go_auto_sameids = 1
  let g:go_fmt_command = "goimports"

  " run :GoBuild or :GoTestCompile based on the go file
  function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
      call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
      call go#cmd#Build(0)
    endif
  endfunction

  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
  autocmd FileType go nmap <Leader>r <Plug>(go-run)
  " switch between impls and test
  autocmd Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
  autocmd Filetype go nmap <leader>gah <Plug>(go-alternate-split)
  autocmd Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
augroup END

" put term always to the bottom
autocmd FileType term wincmd J

" Air Line Config
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='oceanicnext'

" Window switching
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" command-t configurations
let g:CommandTWildIgnore=&wildignore . ",*/node_modules"

" NEOMAKE---------
" When writing a buffer (no delay).
call neomake#configure#automake('w')

augroup typescript
  " Tsuquyomi config
  let g:tsuquyomi_single_quote_import=1
  autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
  autocmd FileType typescript nmap <buffer> <Leader>i <Plug>(TsuquyomiImport)
  autocmd FileType typescript nmap <buffer> <Leader>d <Plug>(TsuDefinition)
augroup END

" Indent Guide Configuration
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_char = '·'

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_typescript_checkers = ['tslint']
let syntastic_mode_map = { 'passive_filetypes': ['html'] }
