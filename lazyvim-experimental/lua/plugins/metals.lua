return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      metals = {
        keys = {
          {
            "<leader>me",
            function()
              require("telescope").extensions.metals.commands()
            end,
            desc = "Metals commands",
          },
          {
            "<leader>mc",
            function()
              require("metals").compile_cascade()
            end,
            desc = "Metals compile cascade",
          },
          {
            "<leader>mh",
            function()
              require("metals").hover_worksheet()
            end,
            desc = "Metals hover worksheet",
          },
        },
        init_options = {
          statusBarProvider = "off",
        },
        settings = {
          showImplicitArguments = true,
          excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },

          inlayHints = {
            hintsInPatternMatch = { enable = true },
            implicitArguments = { enable = true },
            implicitConversions = { enable = true },
            inferredTypes = { enable = true },
            typeParameters = { enable = true },
          },
        },
      },
    },
    setup = {
      metals = function(_, opts)
        local metals = require("metals")
        local metals_config = vim.tbl_deep_extend("force", metals.bare_config(), opts)
        metals_config.on_attach = LazyVim.has("nvim-dap") and metals.setup_dap or nil

        local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
          pattern = { "scala", "sbt" },
          callback = function()
            metals.initialize_or_attach(metals_config)
          end,
          group = nvim_metals_group,
        })
        return true
      end,
    },
  },
}
