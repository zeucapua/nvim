return {
	"theprimeagen/harpoon",
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		})

		vim.keymap.set("n", "<leader>pa", function() harpoon:list():add() end)
		vim.keymap.set("n", "<leader>po", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		vim.keymap.set("n", "<leader>p1", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<leader>p2", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<leader>p3", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<leader>p4", function() harpoon:list():select(4) end)
		vim.keymap.set("n", "<leader>p5", function() harpoon:list():select(5) end)
		vim.keymap.set("n", "<leader>p6", function() harpoon:list():select(6) end)
		vim.keymap.set("n", "<leader>p7", function() harpoon:list():select(7) end)
	end
}
