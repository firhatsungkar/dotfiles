return {
	'famiu/bufdelete.nvim',
	config = function()
		vim.keymap.set("n", "qq", ":Bdelete!<cr>", { noremap = true, silent = true })
	end
}
