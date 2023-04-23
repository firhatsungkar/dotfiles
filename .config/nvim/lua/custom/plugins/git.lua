return {
	'tpope/vim-fugitive',
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, {
			silent = true,
			noremap = true,
			desc = "[G]it [S]tatus"
		})
	end
}
