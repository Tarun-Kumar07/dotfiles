local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- For vim practice
  use("ThePrimeagen/vim-be-good")
  use("takac/vim-hardtime")

  --colorscheme
  use("EdenEast/nightfox.nvim")
  use("sainnhe/gruvbox-material")

  --lualine
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  --bufferline
  -- use({
  -- 	"akinsho/bufferline.nvim",
  -- 	tag = "v2.*",
  -- 	requires = "kyazdani42/nvim-web-devicons",
  -- 	config = function()
  -- 		vim.opt.termguicolors = true
  -- 		require("bufferline").setup({})
  -- 	end,
  -- })

  --basic ide features
  use("kyazdani42/nvim-tree.lua")
  use("Yggdroot/indentLine")
  use("jiangmiao/auto-pairs")
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
  use("tpope/vim-surround")
  use("ThePrimeagen/harpoon")

  --lsp
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")
  use("jose-elias-alvarez/null-ls.nvim")

  --nvim-cmp
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-calc")
  use("hrsh7th/nvim-cmp")

  --snippets
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")

  --for telescope
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("nvim-telescope/telescope-ui-select.nvim")

  --Treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("nvim-treesitter/playground")

  --Github
  use("tpope/vim-fugitive")
  use("lewis6991/gitsigns.nvim")

  --java
  use("mfussenegger/nvim-jdtls")

  -- Debugger
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'

  --Todos
  -- 'tools-life/taskwiki';
  -- {'vimwiki/vimwiki', branch = 'dev'};
  -- 'iamcco/markdown-preview.nvim';

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
