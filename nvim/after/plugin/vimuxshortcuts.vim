function! GetVisualSelection()
  try
    let a_save = @a
    normal! gv"ay
    return @a
  finally
    let @a = a_save
  endtry
endfunction

map <Leader>rr :call VimuxRunCommand(GetVisualSelection())<CR>
autocmd FileType ruby nnoremap <buffer> <Leader>rc :call VimuxRunCommand('rubocop -A ' . expand('%:r') . '.' . expand('%:e'))<CR>
autocmd FileType ruby nnoremap <buffer> <Leader>rt :call VimuxRunCommand('testrbl ' . expand('%:r'))<CR>
autocmd FileType ruby nnoremap <buffer> <Leader>rl :call VimuxRunCommand('testrbl ' . expand('%:r') . '.' . expand('%:e') . ':' . line("."))<CR>
autocmd FileType scala nnoremap <buffer> <Leader>rt :call VimuxRunCommand('sbt "testOnly *' . expand('%:t:r') . '"')<CR>
autocmd FileType scala vnoremap <buffer> <Leader>rl :call VimuxRunCommand('sbt "testOnly *' . expand('%:t:r') . ' -- -z ' . GetVisualSelection() . '"')<CR>
