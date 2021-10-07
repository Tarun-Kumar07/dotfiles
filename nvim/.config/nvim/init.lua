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
 'nvim-lua/completion-nvim';
 'hrsh7th/nvim-compe';
  --lsp
 'neovim/nvim-lspconfig';
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

