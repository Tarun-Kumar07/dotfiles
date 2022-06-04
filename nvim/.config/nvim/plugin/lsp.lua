local nvim_lsp_installer = require("nvim-lsp-installer")
local nvim_lsp = require("lspconfig")
local cmp = require("cmp_nvim_lsp")
local null_ls = require("null-ls")
local util = require("vim.lsp.util")

--null ls
local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics
null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.clang_format.with({ extra_args = { "--style=Google" } }),
		-- diagnostics.flake8
	},
})

local servers = { "pyright", "sumneko_lua", "clangd", "jdtls" }
nvim_lsp_installer.setup({
	ensure_installed = servers,
})

--LSP formatting, to allow formatting using null_ls
local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end
-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local noremap = function(key)
		vim.api.nvim_buf_set_keymap(bufnr, "n", key[1], key[2], { noremap = true, silent = true })
	end

	noremap({ "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>" })
	noremap({ "gd", "<cmd>lua vim.lsp.buf.definition()<CR>" })
	noremap({ "K", "<cmd>lua vim.lsp.buf.hover()<CR>" })
	noremap({ "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>" })
	noremap({ "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>' })
	noremap({ "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" })
	noremap({ "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>" })
	noremap({ "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>" })
	noremap({ "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>" })
	noremap({ "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>" })
	noremap({ "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>" })
	noremap({ "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>" })
	noremap({ "gr", "<cmd>lua vim.lsp.buf.references()<CR>" })
	noremap({ "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" })
	noremap({ "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>" })
	noremap({ "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>" })
	noremap({ "<space>q", "<cmd>lua vim.diagnostic.set_loclist()<CR>" })

	--null_ls formatting
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
		capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	})
end

-------------- lsp diagnostic settings -----------------------
local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
	-- disable virtual text
	virtual_text = false,
	-- show signs
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(config)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})
