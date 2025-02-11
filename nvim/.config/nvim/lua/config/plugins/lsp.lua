local function lsp_keymaps(bufnr)
	local function noremap(key)
		vim.api.nvim_buf_set_keymap(bufnr, "n", key[1], key[2], { noremap = true, silent = true })
	end

	noremap({ "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>" })
	noremap({ "gd", "<cmd>lua vim.lsp.buf.definition()<CR>" })
	noremap({ "K", "<cmd>lua vim.lsp.buf.hover()<CR>" })
	noremap({ "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>" })
	noremap({ "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>' })
	noremap({ "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" })
	-- noremap({ "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>" })
	-- noremap({ "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>" })
	-- noremap({ "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>" })
	noremap({ "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>" })
	noremap({ "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>" })
	noremap({ "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>" })
	noremap({ "gr", "<cmd>lua vim.lsp.buf.references()<CR>" })
	-- noremap({ "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" })
	noremap({ "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>" })
	noremap({ "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>" })
	noremap({ "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>" })

	vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
end

local function on_attach(client, bufnr)
  lsp_keymaps(bufnr)
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/lazydev.nvim",
      opts = {
        library = {
          -- This makes global vim object accessible to lsp
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
     require("lspconfig").lua_ls.setup({on_attach=on_attach})
  end
}
