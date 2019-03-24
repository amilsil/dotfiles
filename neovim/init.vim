" Basics
set encoding=utf-8
set clipboard=unnamed
set ignorecase
set smartcase
set incsearch
set hlsearch
set expandtab
set tabstop=4 shiftwidth=4
set mouse=a "enable mouse on all modes
set nowrap
set cursorline
set scrolloff=5
set autoread<

" ESCape easily with
inoremap kj <ESC>
inoremap KJ <ESC>
inoremap <ESC> <Nop>

" Use j,k for navigating up/down wrapped text
nnoremap j gj
nnoremap k gk

" Remove vertical splitbar
" \SPACE
:set fillchars+=vert:\|

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
nnoremap <A-S-right>  :tabnext<CR>
nnoremap <A-S-left> :tabprevious<CR>
nnoremap <A-S-up> :tabnew<CR>
nnoremap <A-S-down> :tabclose<CR>

function! GetVisualSelection()
  try
    let a_save = @a
    normal! gv"ay
    return @a
  finally
    let @a = a_save
  endtry
endfunction

"
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'morhetz/gruvbox'
    " Colorscheme is set after pugins are initalized
    set background=dark
    let g:gruvbox_invert_signs=0
    let g:gitgutter_override_sign_column_highlight=1

" Try to run vim-test tests on tmux
Plug 'benmills/vimux'
    map <Leader>vi :VimuxInspectRunner<CR>
    map <Leader>vl :VimuxRunLastCommand<CR>
    map <Leader>vp :VimuxPromptCommand<CR>
    map <Leader>vq :VimuxCloseRunner<CR>
    map <Leader>vz :VimuxZoomRunner<CR>
    map <Leader>rr :call VimuxRunCommand(GetVisualSelection())<CR>

" Use vim mappings for navigating between vim and tmux
Plug 'christoomey/vim-tmux-navigator'

" Search within files
Plug 'mileszs/ack.vim'

" Distraction Free Writing
Plug 'junegunn/goyo.vim'
    let g:goyo_width = 120
    noremap <leader>rd :Goyo<CR>

" Highligh focused area
Plug 'junegunn/limelight.vim'

Plug 'junegunn/vim-easy-align'

Plug 'tpope/vim-surround'

" Move selections with Alt-[hjkl]
Plug 'matze/vim-move'
    vmap <S-k> <Plug>MoveBlockUp
    vmap <S-j> <Plug>MoveBlockDown

Plug 'itchyny/lightline.vim'
    let g:lightline = {
          \ 'active': {
          \   'left': [ [], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
          \ },
          \ 'component_function': {
          \   'gitbranch': 'fugitive#head'
          \ },
      \ }

Plug 'ctrlpvim/ctrlp.vim'
    noremap <leader>l :CtrlP<CR>
    noremap <leader>b :CtrlPBuffer<CR>
    noremap <leader>x :CtrlPCurFile<CR>
    let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|bin\|lib\'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Highlight when yanked
Plug 'machakann/vim-highlightedyank'

" Remember multiple yanks
Plug 'vim-scripts/YankRing.vim'
    nnoremap <silent> <leader>ys :YRShow<CR>

" Repeat plugin commands
Plug 'tpope/vim-repeat'

" Tag navigation support
Plug 'majutsushi/tagbar'
    " Have to brew install ctags-exuberant
    let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
    let g:tagbar_type_typescript = {
      \ 'ctagsbin' : 'tstags',
      \ 'ctagsargs' : '-f-',
      \ 'kinds': [
        \ 'e:enums:0:1',
        \ 'f:function:0:1',
        \ 't:typealias:0:1',
        \ 'M:Module:0:1',
        \ 'I:import:0:1',
        \ 'i:interface:0:1',
        \ 'C:class:0:1',
        \ 'm:method:0:1',
        \ 'p:property:0:1',
        \ 'v:variable:0:1',
        \ 'c:const:0:1',
      \ ],
      \ 'sort' : 0
    \ }

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

Plug 'bronson/vim-trailing-whitespace'
    noremap <leader>wl :FixWhitespace<CR>

" Load settings from .editorconfig
Plug 'editorconfig/editorconfig-vim'

" Create braces automatically
Plug 'jiangmiao/auto-pairs'

" On-demand loading
Plug 'scrooloose/nerdtree'
    noremap <leader>nf :NERDTreeFind<CR>
    noremap <leader>nt :NERDTreeToggle<CR>

" Syntastic
Plug 'scrooloose/syntastic'
    let g:syntastic_typescript_checkers = ['tslint']

" Git Fugitive
Plug 'tpope/vim-fugitive'
    :nnoremap <leader>gs :Gstatus<CR>

" Git status in the Gutter
Plug 'airblade/vim-gitgutter'
    hi GitGutterAdd          ctermbg=235
    hi GitGutterChange       ctermbg=235
    hi GitGutterDelete       ctermbg=235
    hi GitGutterChangeDelete ctermbg=235

Plug 'prettier/vim-prettier', {
            \ 'do': 'npm install',
            \ 'for': ['javascript', 'typescript', 'typescript.tsx', 'css', 'less', 'scss'] }

" =======================================================================
" LANGUAGES
" =======================================================================
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)

" GOLANG
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
        elseif l:file =~# '^\f\+\.go$' call go#cmd#Build(0)
        endif
      endfunction

      autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>
      autocmd FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)
      autocmd FileType go nmap <Leader>gr <Plug>(go-run)
      autocmd FileType go nmap <Leader>gt <Plug>(go-test)
      " switch between impls and test
      autocmd Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
      autocmd Filetype go nmap <leader>gah <Plug>(go-alternate-split)
      autocmd Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
    augroup END

" JAVASCRIPT, TYPESCRIP, THTML, JSX
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" typescript syntax and formatting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
    autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
    augroup typescript
      let g:nvim_typescript#diagnostics_enable=0
      autocmd FileType typescript,typescript.tsx nmap <buffer> <Leader>e :TSRename<CR>
      autocmd FileType typescript,typescript.tsx nmap <buffer> <Leader>i :TSImport<CR>
      autocmd FileType typescript,typescript.tsx nmap <buffer> <Leader>fd :TSDef<CR>
      autocmd FileType typescript,typescript.tsx nmap <buffer> <Leader>fc :TSDoc<CR>
      autocmd FileType typescript,typescript.tsx nmap <buffer> <Leader>ft :TSType<CR>
      autocmd FileType typescript,typescript.tsx nmap <buffer> <Leader>fu :TSRefs<CR>
      autocmd FileType typescript,typescript.tsx nmap <buffer> <Leader>fs :TSGetDocSymbols<CR>
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

" MARKDOWN
Plug 'plasticboy/vim-markdown'
    augroup markdown
        " Set readability width and wrap for markdown
        autocmd FileType markdown let g:goyo_width = 60
        autocmd FileType markdown :set wrap
    augroup END

" CSHARP
Plug 'OmniSharp/omnisharp-vim'
    let g:OmniSharp_server_path = '/Users/amil/omnisharp.http-osx'
    let g:Omnisharp_start_server = 1
    "let g:Omnisharp_port = 2000
    let g:OmniSharp_timeout = 5
    let g:OmniSharp_use_random_port = 1
    " User ctrl+p for completion
    let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim
    set completeopt=longest,menuone,preview

    " OmniSharp won't work without this setting
    filetype plugin on

    " Fetch full documentation during omnicomplete requests.
    " There is a performance penalty with this (especially on Mono).
    " By default, only Type/Method signatures are fetched. Full documentation can
    " still be fetched when you need it with the :OmniSharpDocumentation command.
    "let g:omnicomplete_fetch_full_documentation = 1

    " Set desired preview window height for viewing documentation.
    " You might also want to look at the echodoc plugin.
    set previewheight=5

    " Tell ALE to use OmniSharp for linting C# files, and no other linters.
    let g:ale_linters = { 'cs': ['OmniSharp'] }

    " Fetch semantic type/interface/identifier names on BufEnter and highlight them
    let g:OmniSharp_highlight_types = 1

    augroup omnisharp_commands
        autocmd!

        " When Syntastic is available but not ALE, automatic syntax check on events
        " (TextChanged requires Vim 7.4)
        " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

        " Show type information automatically when the cursor stops moving
        autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

        " Update the highlighting whenever leaving insert mode
        autocmd InsertLeave *.cs call OmniSharp#HighlightBuffer()

        " Alternatively, use a mapping to refresh highlighting for the current buffer
        autocmd FileType cs nnoremap <buffer> <Leader>th :OmniSharpHighlightTypes<CR>

        " The following commands are contextual, based on the cursor position.
        autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

        " Finds members in the current buffer
        autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

        autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
        autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
        autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

        " Navigate up and down by method/property/field
        autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
        autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
    augroup END

    " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
    nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
    " Run code actions with text selected in visual mode to extract method
    xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

    " Rename with dialog
    nnoremap <Leader>nm :OmniSharpRename<CR>
    nnoremap <F2> :OmniSharpRename<CR>
    " Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
    command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

    nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

    " Start the omnisharp server for the current solution
    nnoremap <Leader>ss :OmniSharpStartServer<CR>
    nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Enable snippet completion
" let g:OmniSharp_want_snippet=1
" Initialize plugin system
call plug#end()

" Cannot be done before plugins are initialized
colorscheme Gruvbox
" Set background to terminal background color
highlight Normal ctermbg=NONE
highlight VertSplit ctermbg=NONE
highlight CursorLine ctermbg=0

" Spotify
augroup spotify
    nmap <silent> <Leader>spx :!spotify pause<CR>
    nmap <silent> <Leader>spp :!spotify play<CR>
    nmap <silent> <Leader>spi :!spotify info<CR>
    nmap <silent> <Leader>spn :!spotify next<CR>
    nmap <silent> <Leader>spb :!spotify back<CR>
    nmap <silent> <Leader>spv :!spotify volume<CR>
    nmap <silent> <Leader>spm :!spotify mute<CR>
augroup END

" Custom scripts
source ~/.config/nvim/scripts.vim
