local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	print("Neotest not installed")
	return
end


-- TODO
-- Dynamically take the python path by doing where python
-- local on_exit = function(obj)
--   print(obj.code)
--   print(obj.signal)
--   print(obj.stdout)
--   print(obj.stderr)
-- end
-- Run asynchronously
-- vim.system({'where', 'python'}, { text = true }, on_exit)
-- Run synchronously
-- local obj = vim.system({'echo', 'hello'}, { text = true }):wait()
-- { code = 0, signal = 0, stdout = 'hello', stderr = '' }

neotest.setup({
	adapters = {
		require("neotest-python")({
			dap = { justMyCode = false },
			python = "/Users/tarun/.virtualenvs/cirq-py3/bin/python",
		}),
	},
})

vim.keymap.set("n", "<leader>rt", function() neotest.run.run() end)
vim.keymap.set("n", "<leader>st", function() neotest.run.stop() end)
vim.keymap.set("n", "<leader>rT", function() neotest.run.run(vim.fn.expand("%")) end)
vim.keymap.set("n", "<leader>dt", function() neotest.run.run({strategy = "dap"}) end)
vim.keymap.set("n", "<leader>tr", function() neotest.output.open({enter=true,last_run=true,auto_close=true,short=false})end) 
