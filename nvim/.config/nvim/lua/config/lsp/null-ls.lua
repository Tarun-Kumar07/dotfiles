local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

--null ls
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--single-quote" } }),
		formatting.stylua,
		formatting.clang_format,
		formatting.black,
		diagnostics.eslint,
		diagnostics.pylint,
	},
})
