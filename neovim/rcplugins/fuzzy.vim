"Plug 'ctrlpvim/ctrlp.vim'
    "noremap <leader>l :CtrlP<CR>
    "noremap <leader>b :CtrlPBuffer<CR>
    "noremap <leader>x :CtrlPCurFile<CR>
    "let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|bin\|lib\'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

augroup fzf
    nnoremap <silent> <leader>ff :Files<CR>
    " Ag for search in files.
    nnoremap <silent> <leader>fs :Ag<CR>
    nnoremap <silent> <leader>fb :Buffers<CR>
    " Git commits, if a repo.
    nnoremap <silent> <leader>fc :Commits<CR>
    " Vim commands
    nnoremap <silent> <leader>fm :Commands<CR>
    " Lines in loaded buffers.
    nnoremap <silent> <leader>fl :Lines<CR>
augroup end
