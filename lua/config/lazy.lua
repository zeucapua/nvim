-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pq", vim.cmd.q)
vim.keymap.set("n", "<leader>pp", vim.cmd.Explore)
vim.keymap.set("n", "<leader>pl", vim.cmd.split)
vim.keymap.set("n", "<leader>pv", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>[[", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>]]", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>pe", vim.diagnostic.open_float)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

vim.opt.guicursor = ""
vim.opt.cursorline = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")


-- Setup lazy.nvim
require("lazy").setup({
  -- plugins
  spec = {
    { "nxvu699134/vn-night.nvim" },
    { "xiyaowong/nvim-transparent" },
    { "lukas-reineke/indent-blankline.nvim" },
    { "nvim-tree/nvim-tree.lua" },
    { "theprimeagen/harpoon" },
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    { 
      "hrsh7th/nvim-cmp",
      version = false,
      event = "InsertEnter",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },

      opts = function()
        vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
        local cmp = require("cmp")
        local defaults = require("cmp.config.default")()
        local auto_select = true
        return {
          auto_brackets = {}, -- configure any filetype to auto add brackets
          completion = {
            completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
          },
          preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,

          mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
            ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
          }),

          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "path" },
          }, {
            { name = "buffer" },
          }),
          formatting = {
            format = function(entry, item)
              local widths = {
                abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
                menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
              }

              for key, width in pairs(widths) do
                if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                  item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
                end
              end

              return item
            end,
          }
        }
      end,
    },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {},
      dependencies = {
          { "mason-org/mason.nvim", opts = {} },
          "neovim/nvim-lspconfig",
      },
    },
    { "nvim-treesitter/nvim-treesitter",
      branch = 'master', 
      lazy = false, 
      build = ":TSUpdate"
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = {},
  -- automatically check for plugin updates
  checker = { enabled = true },
})
