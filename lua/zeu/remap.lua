vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pq", vim.cmd.q)
vim.keymap.set("n", "<leader>pl", vim.cmd.split)
vim.keymap.set("n", "<leader>pv", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>[[", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>]]", vim.diagnostic.goto_next)
