function Custom_set_colors(color)
	color = color or 'poimandres'
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

Custom_set_colors('poimandres')
