-- uncomment to install packer
-- local fn = vim.fn
-- local install_path = fn.stdpath('data') .. 'site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--   fn.system({'git', 'clone', '--depth=1', 'https://github.com/wbthomason/packer.nvim', install_path})
-- end
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'ThePrimeagen/vim-be-good'
  --colorscheme
  use 'gruvbox-community/gruvbox'
  use 'arcticicestudio/nord-vim'
  -- 'morhetz/gruvbox';
  --airline
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  --basic ide features
  use 'Yggdroot/indentLine'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-commentary'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  --lsp
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'L3MON4D3/LuaSnip'
  --for telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  --Treesitter
  -- use {'nvim-treesitter/nvim-treesitter', do = 'TSUpdate'} 
  use 'nvim-treesitter/playground'
  --Github
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter' --highlights for github change
  --Todos
  -- 'tools-life/taskwiki'; 
  -- {'vimwiki/vimwiki', branch = 'dev'};
  -- 'iamcco/markdown-preview.nvim';
end)

