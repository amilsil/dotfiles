return {
  "amilsil/codewho",
  dependencies = { "hoob3rt/lualine.nvim" },
  init = function()
    require("lualine").setup({
      sections = {
        lualine_z = { "location", "require'codewho'.codewho()" },
      },
    })
  end,
}
