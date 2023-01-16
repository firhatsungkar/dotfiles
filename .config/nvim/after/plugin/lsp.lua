local lsp = require 'lsp-zero'
local null_ls = require 'null-ls'

lsp.preset 'recommended'
lsp.ensure_installed {
  'tsserver',
  'eslint',
  'sumneko_lua',
  'pyright',
}

lsp.on_attach(function(client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  local telescope = function(func_name, with_preview)
    local status_ok, _ = pcall(require, 'telescope.builtin')
    if not status_ok then
      print 'Need to install telescope package.'
      return function() end
    end
    local builtin = require 'telescope.builtin'
    local theme_dropdown = require('telescope.themes').get_dropdown { previewer = false }
    local theme_ivy = require('telescope.themes').get_ivy()
    return function()
      if builtin[func_name] then
        if with_preview then
          return builtin[func_name](theme_ivy)
        else
          return builtin[func_name](theme_dropdown)
        end
      else
        print('Function: ' .. func_name .. ' not supported in telescope builtin')
      end
    end
  end

  if client.name == 'eslint' then
    vim.cmd.LspStop 'eslint'
    return
  end

  if client.name == 'pyright' then
    vim.api.nvim_buf_create_user_command(bufnr, 'Run', function(_)
      vim.cmd "!python % "
    end, { desc = "Execute current buffer" })
  end


  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame.')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction.')

  -- Goto keymaps
  nmap('gd', telescope('lsp_definitions', true), '[G]o to [D]efinition.')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('gr', telescope 'lsp_references', '[G]oto [R]eferences')
  nmap('<leader>rr', vim.lsp.buf.references, 'Buffe[r] [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')

  -- Symbols keymaps
  nmap('<leader>ds', telescope 'lsp_document_symbols', '[D]ocument [S]ymbols')
  nmap('<leader>ws', telescope('lsp_dynamic_workspace_symbols', true), '[W]orkspace [S]ymbols')

  -- Workspace keymaps
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Documentation keymaps
  nmap('K', vim.lsp.buf.hover, 'Hover documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature documentation')

  -- Formatting keymaps
  local desc_format = '[F]ormat current buffer with LSP'
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = desc_format })
  vim.keymap.set('n', '<leader>f', ':Format<CR>')

  -- Diagnostic keymaps
  nmap('<leader>d', vim.diagnostic.open_float, 'Open [D]iagnostic')
  nmap('[d', vim.diagnostic.goto_next, 'Go to next [D]iagnostic')
  nmap(']d', vim.diagnostic.goto_prev, 'Go to previous [D]iagnostic')
end)

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

vim.diagnostic.config {
  virtual_text = true,
}

local mason_nullls = require 'mason-null-ls'
mason_nullls.setup {
  ensure_installed = { 'prettier', 'stylua', 'jq' },
  automatic_installation = true,
  automatic_setup = true,
}
mason_nullls.setup_handlers {}
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.completion.spell,
  },
})

-- Fidget setup
require('fidget').setup()

-- Setup neovim lua configuration
require('neodev').setup()

lsp.nvim_workspace()

lsp.setup()
