local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

local function get_config(name)
  return string.format('require("config.%s")', name)
end

return require("packer").startup(function(use)
  -- GUI
  use "ellisonleao/gruvbox.nvim"
  use {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        timeout = 5000,
      })
      vim.notify = require("notify")
    end
  }
  use {
    "anuvyklack/windows.nvim",
    requires = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup()
    end
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = get_config("gui.tree"),
  }

  use "neovim/nvim-lspconfig"

  -- Auto complete
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lsp-document-symbol"
  use "tamago324/cmp-zsh"

  -- Snippets
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use "saadparwaiz1/cmp_luasnip"

  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-rs.nvim"
  use "nvim-telescope/telescope-fzf-writer.nvim"
  use "nvim-telescope/telescope-packer.nvim"
  use "nvim-telescope/telescope-fzy-native.nvim"
  use "nvim-telescope/telescope-github.nvim"
  use "nvim-telescope/telescope-symbols.nvim"

  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "nvim-telescope/telescope-hop.nvim" }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use { "nvim-telescope/telescope-ui-select.nvim" }

  -- Tree Sitter
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/playground"

  use "windwp/nvim-ts-autotag"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "b3nj5m1n/kommentary" -- comments

  -- Coding
  use {
    "ray-x/go.nvim",
    requires = "ray-x/guihua.lua",
    config = get_config("coding.go"),
    ft = { "go" }
  }
  use "neovim/pynvim"

  -- Formatting
  -- use "sbdchd/neoformat"
  use "lukas-reineke/indent-blankline.nvim"
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = get_config("lsp.null-ls"),
  })
  use "editorconfig/editorconfig-vim"

  if packer_bootstrap then
    require('packer').sync()
  end
end)

