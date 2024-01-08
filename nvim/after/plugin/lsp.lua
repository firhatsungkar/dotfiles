-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

local servers = {
  emmet_ls = { filetypes = { 'php', } },
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}
