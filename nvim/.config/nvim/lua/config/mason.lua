local status_ok, mason = pcall(require, "mason")
if not status_ok then
  print("Mason not installed")
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  print("Mason Installer not installed")
end

mason.setup()
mason_lspconfig.setup({
  ensure_installed = { "pyright", "clangd", "lua_ls", "jdtls", "lemminx" }
})
