vim.keymap.set("n", "<leader>a", function()
	require("harpoon.mark").add_file()
end)
vim.keymap.set("n", "<C-e>", function()
	require("harpoon.ui").toggle_quick_menu()
end)

-- vim.keymap.set("n", "<C-1>", function() require("harpoon.ui").nav_file(1) end)
-- vim.keymap.set("n", "<C-2>", function() require("harpoon.ui").nav_file(2) end)
-- vim.keymap.set("n", "<C-3>", function() require("harpoon.ui").nav_file(3) end)
-- vim.keymap.set("n", "<C-4>", function() require("harpoon.ui").nav_file(4) end)

-- vim.keymap.set("n", "<C-t>", function() require("harpoon.cmd-ui").toggle_quick_menu() end)
-- vim.keymap.set("n", "<C-b>",
--   function() require("harpoon.term").sendCommand(1, 1) require("harpoon.term").gotoTerminal(1) end)
