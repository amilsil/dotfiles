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
set mouse=a "enable mouse on all modes
set nowrap

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
    map <Leader>vi :VimuxInspectRunner<CR>
    map <Leader>vl :VimuxRunLastCommand<CR>
    map <Leader>vp :VimuxPromptCommand<CR>
    map <Leader>vq :VimuxCloseRunner<CR>

Plug 'christoomey/vim-tmux-navigator'

Plug 'mileszs/ack.vim'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline'

Plug 'ctrlpvim/ctrlp.vim'
    noremap <leader>l :CtrlP<CR>
    noremap <leader>b :CtrlPBuffer<CR>
    let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|bin\|lib\'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    let g:UltiSnipsEditSplit="vertical"

Plug 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = '<C-n>'
    let g:SuperTabCrMapping = 0
    let g:UltiSnipsExpandTrigger           = '<tab>'
    let g:UltiSnipsJumpForwardTrigger      = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
    let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

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
            \ 'for': ['javascript', 'typescript', 'typescript.tsx', 'css', 'less', 'scss'] }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'buoto/gotests-vim'
    let g:gotests_bin = '/Users/amil/go/bin/gotests'
" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
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

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" typescript syntax and formatting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
    autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
    augroup typescript
      autocmd FileType typescript,typescript.tsx nmap <buffer> <Leader>e :TSRename<CR>
      autocmd FileType typescript,typescript.tsx nmap <buffer> <Leader>i :TSImport<CR>
      autocmd FileType typescript,typescript.tsx nmap <buffer> <Leader>fd :TSDef<CR>
      autocmd FileType typescript,typescript.tsx nmap <buffer> <Leader>fc :TSDoc<CR>
      autocmd FileType typescript,typescript.tsx nmap <buffer> <Leader>d :TSType<CR>
      autocmd FileType typescript,typescript.tsx nmap <buffer> <Leader>fi :TSRefs<CR>
    augroup END

" Html Math Tags
Plug 'valloric/matchtagalways'
    let g:mta_filetypes = {
        \ 'javascript.jsx' : 1,
        \ 'typescript.tsx' : 1,
        \ 'html' : 1,
        \ 'xhtml' : 1,
        \ 'xml' : 1,
        \ 'jinja' : 1,
        \}

" Initialize plugin system
call plug#end()
