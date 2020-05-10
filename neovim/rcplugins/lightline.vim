Plug 'itchyny/lightline.vim'
    let g:lightline = {
          \ 'active': {
          \   'left': [ [], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
          \ },
          \ 'component_function': {
          \   'gitbranch': 'fugitive#head'
          \ },
      \ }
