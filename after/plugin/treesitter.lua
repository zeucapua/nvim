require("nvim-treesitter.configs").setup {
  ensure_installed = { "javascript", "typescript", "html", "css", "astro", "svelte" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}
