vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

vim.api.nvim_create_user_command("RevertChanges", function ()
	vim.cmd "!git checkout %"
end, { desc="Revert changes of current buffers." })
