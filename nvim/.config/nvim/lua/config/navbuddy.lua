local navbuddy = require("nvim-navbuddy")

navbuddy.setup({})

local map = function(key)
	vim.keymap.set("n", key[1], key[2])
end
map({
	"<leader>fs",
	function()
		navbuddy.open()
	end,
})
