vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- For vim practice
	use("ThePrimeagen/vim-be-good")
	use("takac/vim-hardtime")

	--colorscheme
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
	use("Yggdroot/indentLine")
	use("jiangmiao/auto-pairs")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("tpope/vim-surround")

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

	--Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/playground")

	--Github
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")

	--Todos
	-- 'tools-life/taskwiki';
	-- {'vimwiki/vimwiki', branch = 'dev'};
	-- 'iamcco/markdown-preview.nvim';
end)
