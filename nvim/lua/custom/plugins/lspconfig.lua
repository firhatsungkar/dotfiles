return {
	'neovim/nvim-lspconfig',
	config = function()
		-- Border config
		vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
		vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

		local border = "single"

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
			vim.lsp.handlers.hover, { border = border }
		)
		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
			vim.lsp.handlers.signature_help, { border = border }
		)
	end
}
