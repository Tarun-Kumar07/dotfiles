-- vim.g.gruvbox_material_transparent_background = 1
-- vim.g.gruvbox_material_background = 'hard'
-- vim.cmd("colorscheme gruvbox-material")
-- vim.cmd("set termguicolors")
-- require("nightfox").setup({
--   options = {
--     transparent = true,
--     styles = {
--       comments = "italic",
--       keywords = "bold",
--       types = "italic,bold",
--     },
--   },
-- })
--
-- vim.cmd("colorscheme nightfox")

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	-- transparent_background = true,
})
-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
