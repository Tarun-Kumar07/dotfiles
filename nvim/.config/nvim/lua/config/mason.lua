local status_ok, mason = pcall(require, "mason")
if not status_ok then
	print("Mason not installed")
end

local status_ok, mason_installer = pcall(require, "mason-tool-installer")
if not status_ok then
	print("Mason Installer not installed")
end

mason.setup()
mason_installer.setup({
	ensure_installed = {
		"pyright",
		"clangd",
		"lua-language-server",
		"jdtls",
		"java-debug-adapter",
		"java-test",
		"stylua",
		"clang-format",
	},
})
