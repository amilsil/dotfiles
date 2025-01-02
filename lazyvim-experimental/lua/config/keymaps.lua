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
