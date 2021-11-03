local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

require "paq" {
  'savq/paq-nvim';
  'ThePrimeagen/vim-be-good';
  --colorscheme
  'gruvbox-community/gruvbox';
  'arcticicestudio/nord-vim';
  -- 'morhetz/gruvbox';
  --airline
  'vim-airline/vim-airline';
  'vim-airline/vim-airline-themes';
  --basic ide features
  'Yggdroot/indentLine';
  'jiangmiao/auto-pairs';
  'tpope/vim-commentary';
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/nvim-cmp';
  --lsp
  'neovim/nvim-lspconfig';
  'glepnir/lspsaga.nvim';  
  'L3MON4D3/LuaSnip';
  --for telescope
  'nvim-lua/popup.nvim';
  'nvim-lua/plenary.nvim';
  'nvim-telescope/telescope.nvim';
  'nvim-telescope/telescope-fzy-native.nvim';
  --Treesitter
  {'nvim-treesitter/nvim-treesitter', ['do'] = 'TSUpdate'} ;
  'nvim-treesitter/playground';
  --Github
  'tpope/vim-fugitive';
  'airblade/vim-gitgutter'; --highlights for github changes
  --Todos
  -- 'tools-life/taskwiki'; 
  -- {'vimwiki/vimwiki', branch = 'dev'};
  -- 'iamcco/markdown-preview.nvim';
}

--Status line
vim.g['airline_powerline_fonts'] = 1

vim.g.mapleader = " "

--Remap for opening file tree
vim.api.nvim_set_keymap('n', '<Leader>pv', ':wincmd v<bar> :Ex <bar>:vertical resize 30<CR>', {noremap = true})

--TreeSitter
require'nvim-treesitter.configs'.setup {
  -- Modules and its options go here
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
}

