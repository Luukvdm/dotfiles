local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require("packer").startup(function(use)
  use "sainnhe/gruvbox-material"
  use "neovim/nvim-lspconfig"
  -- Auto complete
  use "hrsh7th/nvim-cmp"
  -- use "hrsh7th/cmp-cmdline"
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

  use "ray-x/go.nvim"
  use "neovim/pynvim"

  -- Formatting
  use "sbdchd/neoformat"

  if packer_bootstrap then
    require('packer').sync()
  end
end)
