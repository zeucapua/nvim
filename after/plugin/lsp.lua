local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
  "tsserver",
  "html",
  "cssls",
  "astro",
  "svelte",
})

lsp.setup()

vim.keymap.set("n", "<leader>pe", "<cmd>lua vim.diagnostic.open_float()<CR>");
