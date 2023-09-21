local lspconfig = require("lspconfig")

local servers = { "pyright", "lua_ls", "jdtls", "tsserver", "angularls" }

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("config.lsp.handlers").on_attach,
		capabilities = require("config.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "config.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	if server == "jdtls" then
		goto continue
	end
	lspconfig[server].setup(opts)
	::continue::
end
