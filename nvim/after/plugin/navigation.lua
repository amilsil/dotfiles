-- tmux
vim.keymap.set("n", "<Leader>vi", vim.cmd.VimuxInspectRunner)
vim.keymap.set("n", "<Leader>vl", vim.cmd.VimuxRunLastCommand)
vim.keymap.set("n", "<Leader>vp", vim.cmd.VimuxPromptCommand)
vim.keymap.set("n", "<Leader>vq", vim.cmd.VimuxCloseRunner)
vim.keymap.set("n", "<Leader>vz", vim.cmd.VimuxZoomRunner)

-- tree
vim.keymap.set("n", "<Leader>nf", vim.cmd.NERDTreeFind)
vim.keymap.set("n", "<Leader>nt", vim.cmd.NERDTreeToggle)
