local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local packer_bootstrap = ensure_packer()

return require('packer').startup({function(use)
  -- Common Plugins Utils
  use "wbthomason/packer.nvim"                                -- Have packer manage itself
  use "nvim-lua/popup.nvim"                                   -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"                                 -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs"                                 -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim"                                 -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"                          -- Web devs icons
  use "akinsho/toggleterm.nvim"                               -- Toggle terminal

  -- Colorschemes
  -- use "lunarvim/colorschemes.nvim"                         -- A bunch of colorschemes
  -- use "folke/tokyonight.nvim"
  -- use "lunarvim/darkplus.nvim"
  -- use "morhetz/gruvbox"
  -- use 'Mofiqul/vscode.nvim'
  use "olivercederborg/poimandres.nvim"

  -- Auto Completion Plugins
  use "hrsh7th/nvim-cmp"                                      -- The completion plugin
  use "hrsh7th/cmp-buffer"                                    -- buffer completions
  use "hrsh7th/cmp-path"                                      -- path completions
  use "hrsh7th/cmp-cmdline"                                   -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"                              -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"                                  -- lsp completions
  use "hrsh7th/cmp-nvim-lua"                                  -- lua api completions

  -- Snippets Engine Plugins
  use "L3MON4D3/LuaSnip"                                      --snippet engine
  use "rafamadriz/friendly-snippets"                          -- a bunch of snippets to use

  -- LSP Plugins
  use "neovim/nvim-lspconfig"                                 -- Enable LSP
  use { "williamboman/nvim-lsp-installer",                    -- Simple to use language server installer
    require = "neovim/nvim-lspconfig"
  }
  use { "jose-elias-alvarez/null-ls.nvim",                    -- for formatters and linters
    require = "neovim/nvim-lspconfig"
  }


  -- Telescope Plugins
  use {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    require = { {'nvim-lua/plenary.nvim'} }
  }                                                           -- Main gaze plugin
  use {
    'nvim-telescope/telescope-fzf-native.nvim', run = 'make',
    require = 'nvim-telescope/telescope.nvim'
  }                                                           -- FZF sorter
  use "nvim-telescope/telescope-media-files.nvim"             -- Preview media add-on

  -- Treesitter Plugins
  use { "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use { "p00f/nvim-ts-rainbow",
    require = "nvim-treesitter/nvim-treesitter"
  }                                                           -- typescript 
  use { 'JoosepAlviste/nvim-ts-context-commentstring',
    require = "nvim-treesitter/nvim-treesitter"
  }                                                           -- comment based on context (userful for jsx/tsx)
  use { 'nvim-treesitter/nvim-treesitter-context',
    require = "nvim-treesitter/nvim-treesitter"
  }                                                           -- context.vim on treesitter

  -- Refactoring Plugins
  use {
      "ThePrimeagen/refactoring.nvim",
      requires = {
          {"nvim-lua/plenary.nvim"},
          {"nvim-treesitter/nvim-treesitter"}
      }
  }

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- File Explorer
  use { "kyazdani42/nvim-tree.lua",                            -- Nvim Tree (File Explorer)
    require = "kyazdani42/nvim-web-devicons"
  }

  -- Buffer Line
  use { "akinsho/bufferline.nvim",                            -- Buffer line
    require = "kyazdani42/nvim-web-devicons"
  }
  use "moll/vim-bbye"

  -- Lua Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end
  }
}
})

