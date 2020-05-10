" typescript syntax and formatting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
    autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" jsx-typescript
" has to be set after the plugins are initialised
highlight tsxAttrib ctermfg=122 cterm=italic
highlight tsxCloseTag ctermfg=204
highlight tsxCloseString ctermfg=137
