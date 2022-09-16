local M = {}

-- TODO: backfill this to template
M.setup = function()
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
end

-- local function lsp_highlight_document(client)
-- 	-- Set autocommands conditional on server_capabilities
-- 	if client.resolved_capabilities.document_highlight then
-- 		vim.api.nvim_exec(
-- 			[[
--       augroup lsp_document_highlight
--         autocmd! * <buffer>
--         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--       augroup END
--     ]],
-- 			false
-- 		)
-- 	end
-- end

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

M.on_attach = function(client, bufnr)
  -- if client.name == "tsserver" then
  --   client.resolved_capabilities.document_formatting = false
  -- end
  vim.api.nvim_command [[ set ff=unix ]]
  if client.name == "jdt.ls" then
    require("jdtls").setup_dap { hotcodereplace = "auto" }
    require("jdtls.dap").setup_dap_main_class_configs()
    client.server_capabilities.document_formatting = true
  end
  lsp_keymaps(bufnr)
  client.server_capabilities.document_formatting = false
  -- lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
