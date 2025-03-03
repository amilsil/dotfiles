-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- map kj to <Esc>
vim.api.nvim_set_keymap("i", "kj", "<Esc>", { noremap = true, silent = true })

-- set leader to comma
vim.g.mapleader = ","

-- don't use relative line numbers
vim.wo.relativenumber = false
