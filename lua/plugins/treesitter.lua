return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	opts = {
		ensure_installed = {
			"vimdoc",
			"lua",

			"typescript",
			"javascript",
			"tsx",
			"css",
			"html",
			"json",
			"astro",
			"svelte",
		},
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
	build = ":TSUpdate",
	config = function(conf)
		vim.defer_fn(function()
			require("nvim-treesitter.configs").setup(conf.opts)
		end, 0)
	end,
}
