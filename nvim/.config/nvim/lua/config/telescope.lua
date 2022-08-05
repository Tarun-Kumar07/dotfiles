local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	print("Telescope not installed")
	return
end

local map = function(key)
	vim.api.nvim_set_keymap("n", key[1], key[2], { noremap = true })
end

map({ "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>" })
map({ "<leader>fg", ":lua require('telescope.builtin').git_files()<CR>" })
map({ "<leader>ec", ":lua require('telescope.builtin').find_files({hidden=true,cwd='~/.dotfiles/'})  <CR>" })
map({ "<leader>lg", ":lua require('telescope.builtin').live_grep()<cr>" })
map({ "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>" })
map({ "<leader>fh", ":lua require('telescope.builtin').help_tags()<cr>" })
map({ "<leader>ps", ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>" })

telescope.setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
			["fzf"] = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
