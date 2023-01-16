local status_ok, _ = pcall(require, 'bufdelete')

if not status_ok then
  return
end

vim.keymap.set('n', '<leader>q', ':Bdelete!<CR>')
