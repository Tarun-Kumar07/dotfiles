local map = function(key)
  vim.api.nvim_set_keymap("n",key[1],key[2],{noremap = true})
end
  
map { "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>"}
map { "<leader>fg", ":lua require('telescope.builtin').git_files()<CR>" }
map { "<leader>lg", ":lua require('telescope.builtin').live_grep()<cr>"}
map { "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>"}
map { "<leader>fh" ,":lua require('telescope.builtin').help_tags()<cr>"}
map { "<leader>ps", ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>" }

