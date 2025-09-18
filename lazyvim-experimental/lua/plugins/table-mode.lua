return {
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown", "md" },
    config = function()
      vim.g.table_mode_corner = "|"
    end,
  },
}
