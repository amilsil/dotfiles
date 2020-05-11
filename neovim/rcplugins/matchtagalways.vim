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

" Set the highlight colours for MatchTag.
" Only works when these two values are set to 0.
let g:mta_use_matchparen_group=0
let g:mta_set_default_matchtag_color = 0
highlight MatchTag ctermfg=0 ctermbg=238
