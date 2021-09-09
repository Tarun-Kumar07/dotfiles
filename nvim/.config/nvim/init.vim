call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'ThePrimeagen/vim-be-good'
  "colorscheme
  Plug 'gruvbox-community/gruvbox'
  "airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  "basic ide features
  Plug 'Yggdroot/indentLine'
  Plug 'jiangmiao/auto-pairs'
  Plug 'nvim-lua/completion-nvim'
  "lsp
  Plug 'neovim/nvim-lspconfig'
  "for telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  "Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
  Plug 'nvim-treesitter/playground'
  "Github
  Plug 'tpope/vim-fugitive'  
  Plug 'airblade/vim-gitgutter' "highlights for github changes
call plug#end()

"status line
let g:airline_powerline_fonts = 1

let mapleader = " "
"Remap for opening file tree
nnoremap <leader>pv :wincmd v<bar> :Ex <bar>:vertical resize 30<CR>

"TreeSitter
"lua require 'nvim-treesitter.configs'.setup { highlight = { enabled = true } }
lua << EOF
  require'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
  }
EOF

