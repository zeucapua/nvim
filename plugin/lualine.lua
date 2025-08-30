require("lualine").setup({
  options = { theme = "horizon" },
  sections = {
    lualine_b = {{
      'branch',
      fmt = function(str)
        if vim.api.nvim_strwidth(str) > 13 then
            return ("%s…"):format(str:sub(1, 12))
        end

        return str
      end
    }},
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
