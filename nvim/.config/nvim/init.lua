require("plugins")

--Status line
vim.g["airline_powerline_fonts"] = 1
vim.g["airline#extensions#tabline#enabled"] = 0

vim.g.mapleader = " "

--Remap for opening file tree
vim.api.nvim_set_keymap("n", "<Leader>pv", ":wincmd v<bar> :Ex <bar>:vertical resize 30<CR>", { noremap = true })

--TreeSitter
require("nvim-treesitter.configs").setup({
	-- Modules and its options go here
	highlight = { enable = true },
	incremental_selection = { enable = true },
	textobjects = { enable = true },
})
