function! GetVisualSelection()
  try
    let a_save = @a
    normal! gv"ay
    return @a
  finally
    let @a = a_save
  endtry
endfunction

" Try to run vim-test tests on tmux
Plug 'benmills/vimux'
    map <Leader>vi :VimuxInspectRunner<CR>
    map <Leader>vl :VimuxRunLastCommand<CR>
    map <Leader>vp :VimuxPromptCommand<CR>
    map <Leader>vq :VimuxCloseRunner<CR>
    map <Leader>vz :VimuxZoomRunner<CR>
    map <Leader>rr :call VimuxRunCommand(GetVisualSelection())<CR>

" Use vim mappings for navigating between vim and tmux
Plug 'christoomey/vim-tmux-navigator'
