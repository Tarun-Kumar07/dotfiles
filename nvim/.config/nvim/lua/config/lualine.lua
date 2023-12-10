local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	print("Lualine not installed")
	return
end

lualine.setup({ options = { theme = "catppuccin", global_status = true } })

local set = vim.opt
set.laststatus = 3
