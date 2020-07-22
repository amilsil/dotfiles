" typescript syntax and formatting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
    autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" Create JsDocs
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}
