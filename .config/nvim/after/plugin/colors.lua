function firhatsungkar_set_color(color)
	color = color or 'poimandres'
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

firhatsungkar_set_color()
