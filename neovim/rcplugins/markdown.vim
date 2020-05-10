" MARKDOWN
Plug 'plasticboy/vim-markdown'

augroup markdown
    " Set readability width and wrap for markdown autocmd FileType markdown let g:goyo_width = 60
    autocmd FileType markdown :set wrap
augroup END
