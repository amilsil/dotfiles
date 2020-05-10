" On-demand loading
Plug 'scrooloose/nerdtree'
    noremap <leader>nf :NERDTreeFind<CR>
    noremap <leader>nt :NERDTreeToggle<CR>
    :let g:NERDTreeWinSize=30

Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "~",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "~",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
