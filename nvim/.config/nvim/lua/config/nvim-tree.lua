local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local status_ok, api = pcall(require, "nvim-tree.api")
if not status_ok then
	return
end

nvim_tree.setup()

vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		api.tree.find_file()
	end,
})
