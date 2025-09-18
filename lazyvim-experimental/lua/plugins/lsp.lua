return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              hint = { enable = true },
            },
          },
        },
        solargraph = {
          enabled = true,
        },
        ruby_ls = {
          enabled = false,
        },
      },
    },
  },
}
