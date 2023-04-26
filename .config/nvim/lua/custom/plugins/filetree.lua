-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require('neo-tree').setup {
			event_handlers = {
				{
					event = "file_opened",
					handler = function()
						--auto close
						require("neo-tree").close_all()
					end
				},
			}
		}
		vim.keymap.set("n", "<leader>ee", ":Neotree toggle<cr>", {
			silent = true,
			noremap = true,
			desc = "[E]explore Fil[E]"
		})
	end,
}
