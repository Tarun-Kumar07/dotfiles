local status_ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	print("Treesitter config not installed")
	return
end

treesitter_config.setup({
	ensure_installed = { "python", "lua", "java" },
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
})
