local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	print("Lualine not installed")
	return
end

local navic = require("nvim-navic")

lualine.setup({
	options = {
		theme = "catppuccin",
		global_status = true,
	},
	sections = {
		lualine_x = {
			{
				function()
					return navic.get_location()
				end,
				cond = function()
					return navic.is_available()
				end,
			},
		},
	},
})

local set = vim.opt
set.laststatus = 3
