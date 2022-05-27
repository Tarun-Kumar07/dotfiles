local lualine = require("lualine")
local set = vim.opt

--sets global status line
set.laststatus = 3
lualine.setup({ options = { theme = "gruvbox-material" } })
