local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

lazy.setup({

  -- For vim practice
  "ThePrimeagen/vim-be-good",
  "takac/vim-hardtime",

  --colorscheme
  "EdenEast/nightfox.nvim",
  "sainnhe/gruvbox-material",
  "kyazdani42/nvim-web-devicons",

  --lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
  },

  --bufferline
  {
    "akinsho/bufferline.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
  },

  --basic ide features
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
  },
  "Yggdroot/indentLine",
  "jiangmiao/auto-pairs",
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  "tpope/vim-surround",
  "ThePrimeagen/harpoon",

  --mason
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },

  --lsp
  "neovim/nvim-lspconfig",
  "jose-elias-alvarez/null-ls.nvim",

  --nvim-cmp
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-calc",
  "hrsh7th/nvim-cmp",

  --snippets
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp"
  },
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",

  --Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "nvim-treesitter/playground",

  -- Telescope
  "nvim-lua/popup.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "gbrlsnchs/telescope-lsp-handlers.nvim",
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  --Github
  "tpope/vim-fugitive",
  "sindrets/diffview.nvim",
  "lewis6991/gitsigns.nvim",

  --java
  "mfussenegger/nvim-jdtls",

  -- Debugger
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",

  -- Testing
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
  },

  {
    "nvim-neotest/neotest-python",
    dependencies = {
      "nvim-neotest/neotest",
    },
  },

  -- Notifications
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end,
  }
})
