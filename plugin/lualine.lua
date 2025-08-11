require("lualine").setup({
  options = { theme = "horizon" },
  sections = {
    lualine_b = {'branch'},
    lualine_c = {{
      'filename',
      path = 1 -- show relative path 
    }},
    lualine_x = {},
    lualine_y = {'diff', 'diagnostics'}
  },
  inactive_sections = {
    lualine_c = {{
      'filename',
      path = 1 -- show relative path
    }}
  }
})
