return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        jsonnet = { "jsonnetfmt" },
      },
      formatters = {
        jsonnetfmt = {
          prepend_args = {
            "--string-style", "d", -- Use double quotes for strings
            "--comment-style", "s", -- Use slash for comments
            "--indent", "2", -- 2 space indentation
          },
        },
      },
    },
  },
}