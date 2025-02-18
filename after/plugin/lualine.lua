require("lualine").setup({
  options = { theme = "horizon" },
  sections = {
    lualine_b = {'branch'},
    lualine_c = {{
      'filename',
      path = 1
    }},
    lualine_x = {},
    lualine_y = {'diff', 'diagnostics'}
  }
})
