local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.setup()

local servers = {
	ts_ls = {
		-- only enable if there's no deno json in project root
		root_dir = function(startpath)
			local util = require("lspconfig.util")
			local p = util.root_pattern("package.json")(startpath)
			if p ~= nil and not util.path.exists(p .. "/deno.json") then
				return p
			end
		end,
		single_file_support = false,
	},
	-- deno lsp is only enabled if there's a deno.json in the root directory
	denols = {
		root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc"),
	},
	html = {},
	cssls = {},
	astro = {
		root_dir = require("lspconfig.util").root_pattern("astro.config.js", "astro.config.mjs"),
	},
	svelte = {
		root_dir = require("lspconfig.util").root_pattern("svelte.config.js", "svelte.config.mjs"),
	},
}

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      if servers[server_name] ~= nil then
        require('lspconfig')[server_name].setup(servers[server_name])
      else
        require('lspconfig')[server_name].setup({})
      end
    end
  }
})

vim.keymap.set("n", "<leader>pe", "<cmd>lua vim.diagnostic.open_float()<CR>");
