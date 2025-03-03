-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Run the selected text on the tmux pane
-- function! GetVisualSelection()
--   try
--     let a_save = @a
--     normal! gv"ay
--     return @a
--   finally
--     let @a = a_save
--   endtry
-- endfunction
--
-- map <Leader>rr :call VimuxRunCommand(GetVisualSelection())<CR>

-- convert above to lua
local function get_visual_selection()
  local a_save = vim.fn.getreg("a")
  vim.cmd('normal! gv"ay')
  return vim.fn.getreg("a")
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>rr",
  ":call VimuxRunCommand(get_visual_selection())<CR>",
  { noremap = true, silent = true }
)

-- These were old commands, following the lua conversion
-- autocmd FileType ruby nnoremap <buffer> <Leader>rc :call VimuxRunCommand('rubocop -A ' . expand('%:r') . '.' . expand('%:e'))<CR>
-- autocmd FileType ruby nnoremap <buffer> <Leader>rt :call VimuxRunCommand('testrbl ' . expand('%:r'))<CR>
-- autocmd FileType ruby nnoremap <buffer> <Leader>rl :call VimuxRunCommand('testrbl ' . expand('%:r') . '.' . expand('%:e') . ':' . line("."))<CR>
-- autocmd FileType scala nnoremap <buffer> <Leader>rt :call VimuxRunCommand('sbt "testOnly *' . expand('%:t:r') . '"')<CR>
-- autocmd FileType scala vnoremap <buffer> <Leader>rl :call VimuxRunCommand('sbt "testOnly *' . expand('%:t:r') . ' -- -z ' . GetVisualSelection() . '"')<CR>

-- in lua
vim.api.nvim_command(
  "autocmd FileType ruby nnoremap <buffer> <Leader>rc :call VimuxRunCommand('rubocop -A ' . expand('%:r') . '.' . expand('%:e'))<CR>"
)
vim.api.nvim_command(
  "autocmd FileType ruby nnoremap <buffer> <Leader>rt :call VimuxRunCommand('testrbl ' . expand('%:r'))<CR>"
)
vim.api.nvim_command(
  "autocmd FileType ruby nnoremap <buffer> <Leader>rl :call VimuxRunCommand('testrbl ' . expand('%:r') . '.' . expand('%:e') . ':' . line('.'))<CR>"
)
vim.api.nvim_command(
  "autocmd FileType scala nnoremap <buffer> <Leader>rt :call VimuxRunCommand('sbt \"testOnly *' . expand('%:t:r') . '\"')<CR>"
)
vim.api.nvim_command(
  "autocmd FileType scala vnoremap <buffer> <Leader>rl :call VimuxRunCommand('sbt \"testOnly *' . expand('%:t:r') . ' -- -z ' . get_visual_selection() . '\"')<CR>"
)
