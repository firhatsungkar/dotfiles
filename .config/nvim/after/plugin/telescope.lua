local builtin = require 'telescope.builtin'
local theme_dropdown = require('telescope.themes').get_dropdown { previewer = false }
local theme_ivy = require('telescope.themes').get_ivy {}
local keymap = vim.keymap.set

local nmap = function(keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end

  vim.keymap.set('n', keys, func, { desc = desc })
end

-- Telescope remap
keymap('n', '<C-p>', builtin.git_files, {})
keymap('n', '<leader>pf', builtin.find_files, {})
keymap('n', '<leader>ps', function()
  builtin.grep_string { search = vim.fn.input 'Grep > ' }
end)
keymap('n', '<C-r>', function()
  builtin.lsp_document_symbols(theme_dropdown)
end)

-- Find shortcut
nmap('<leader>ff', builtin.find_files, '[F]ind [F]ile')
nmap('<leader>fg', builtin.git_files, '[F]ind [G]it')
nmap('<leader>fh', builtin.help_tags, '[F]ind [H]elp')
nmap('<leader>fw', function()
  builtin.live_grep(theme_ivy)
end, '[F]ind [W]ords')
nmap('<leader>ft', function()
  builtin.grep_string { search = vim.fn.input 'Find Text > ' }
end, '[F]ind [T]ext')

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
