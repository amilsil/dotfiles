Plug 'ctrlpvim/ctrlp.vim'
    noremap <leader>l :CtrlP<CR>
    noremap <leader>b :CtrlPBuffer<CR>
    noremap <leader>x :CtrlPCurFile<CR>
    let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|bin\|lib\'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
