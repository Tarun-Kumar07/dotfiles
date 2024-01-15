local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	print("Neotest not installed")
	return
end

local python_path = vim.fn.exepath("python")

neotest.setup({
	adapters = {
		require("neotest-python")({
			python = python_path,
		}),
		require("neotest-jest")({}),
	},
})

vim.keymap.set("n", "<leader>tr", function()
	neotest.run.run()
end)
vim.keymap.set("n", "<leader>ts", function()
	neotest.run.stop()
end)
vim.keymap.set("n", "<leader>tR", function()
	neotest.run.run(vim.fn.expand("%"))
end)
vim.keymap.set("n", "<leader>td", function()
	neotest.run.run({ strategy = "dap" })
end)
vim.keymap.set("n", "<leader>to", function()
	neotest.output.open({ enter = true, last_run = true, auto_close = true, short = false })
end)
