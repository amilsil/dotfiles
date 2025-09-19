-- Snacks plugin configuration
return {
  {
    "snacks.nvim",
    lazy = false,  -- Load it early to define the global Snacks variable
    config = function()
      -- Define a minimal Snacks global to avoid errors
      _G.Snacks = _G.Snacks or {}
      _G.Snacks.util = _G.Snacks.util or {}
      _G.Snacks.profiler = _G.Snacks.profiler or {}
      _G.Snacks.bufdelete = _G.Snacks.bufdelete or function(n) require("mini.bufremove").delete(n, false) end

      -- Add a minimal color utility function
      _G.Snacks.util.color = _G.Snacks.util.color or function(name)
        local colors = {
          ["Statement"] = "#89DCEB", -- Example sky color from Catppuccin
          ["Constant"] = "#F5C2E7",  -- Example pink color from Catppuccin
          ["Debug"] = "#F38BA8",     -- Example red color from Catppuccin
          ["Special"] = "#FAE3B0",   -- Example yellow color from Catppuccin
        }
        return colors[name] or "#FFFFFF"
      end

      -- Add a minimal profiler status function
      _G.Snacks.profiler.status = function()
        return function() return "" end
      end
    end,
  },
  {
    "nvim-mini/mini.bufremove",
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },
}