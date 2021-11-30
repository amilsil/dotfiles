" Git Fugitive
Plug 'tpope/vim-fugitive'
    :nnoremap <leader>gs :Git<CR>
    " bind K to grep word under cursor
    nnoremap <leader>s :Ggrep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Git status in the Gutter
Plug 'airblade/vim-gitgutter'
augroup GitGutter
    hi GitGutterAdd          ctermbg=NONE
    hi GitGutterChange       ctermbg=NONE
    hi GitGutterDelete       ctermbg=NONE

    hi GitGutterChangeDelete ctermbg=NONE
    hi SignColumn            ctermbg=NONE
augroup END
