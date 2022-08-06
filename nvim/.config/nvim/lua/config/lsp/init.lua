local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- vim.lsp.set_log_level("DEBUG")

require("config.lsp.configs")
require("config.lsp.handlers").setup()
require("config.lsp.null-ls")
