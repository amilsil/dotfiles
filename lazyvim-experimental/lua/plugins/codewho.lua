return {
  "amilsil/codewho",
  dependencies = { "nvim-lualine/lualine.nvim" },
  opts = function()
    -- Make sure Snacks is defined
    if not _G.Snacks then
      _G.Snacks = {
        profiler = {
          status = function()
            return function()
              return "test"
            end
          end,
        },
        util = {
          color = function(name)
            local colors = {
              ["Statement"] = "#89DCEB", -- Example sky color from Catppuccin
              ["Constant"] = "#F5C2E7", -- Example pink color from Catppuccin
              ["Debug"] = "#F38BA8", -- Example red color from Catppuccin
              ["Special"] = "#FAE3B0", -- Example yellow color from Catppuccin
            }
            return colors[name] or "#FFFFFF"
          end,
        },
      }
    end
  end,
  config = function()
    -- Properly add codewho to lualine using the appropriate format
    local function codewho_component()
      return require("codewho").codewho()
    end

    -- Get the current config
    require("lualine").setup({
      sections = {
        lualine_z = { "location", codewho_component }
      },
    })
  end,
}
