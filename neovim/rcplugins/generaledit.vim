Plug 'junegunn/vim-easy-align'

Plug 'tpope/vim-surround'

" Move selections with Alt-[hjkl]
Plug 'matze/vim-move'
    vmap <S-k> <Plug>MoveBlockUp
    vmap <S-j> <Plug>MoveBlockDown

" Repeat plugin commands
Plug 'tpope/vim-repeat'

" Mappings for navigating the quick fixes/errors
Plug 'tpope/vim-unimpaired'

" Highlight when yanked
Plug 'machakann/vim-highlightedyank'

" Remember multiple yanks
Plug 'vim-scripts/YankRing.vim'
    nnoremap <silent> <leader>ys :YRShow<CR>
