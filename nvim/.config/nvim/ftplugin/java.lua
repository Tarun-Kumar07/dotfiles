local status, jdtls = pcall(require, "jdtls")
if not status then
  return
end

-- Determine OS
if vim.fn.has("mac") == 1 then
  -- TODO : will fill when have mac
  SYSTEM = "mac"
  HOME = os.getenv("$HOME")
elseif vim.fn.has("unix") == 1 then
  -- TODO : Complete the template
  SYSTEM = "linux"
  HOME = os.getenv("$HOME")
  JDTLS_LOCATION = vim.fn.stdpath("data") .. "/lsp_servers/jdtls"
  LOMBOK_JAR = "/lombok.jar"
  EQUINOX_JAR = "/plugins/org.eclipse.equinox.launcher_*.jar"
  CONFIG = "/config"
  CACHE = "/.cache/"
else
  --TODO : Automate Debugger and Vs code java test
  SYSTEM = "win"
  HOME = os.getenv("USERPROFILE")
  JDTLS_LOCATION = vim.fn.stdpath("data") .. "\\lsp_servers\\jdtls"
  LOMBOK_JAR = "\\lombok.jar"
  EQUINOX_JAR = "\\plugins\\org.eclipse.equinox.launcher_*.jar"
  CONFIG = "\\config_"
  CACHE = "\\.cache\\"
  JAVA_DEBUGGER = HOME ..
      "\\opensource\\java-debug\\com.microsoft.java.debug.plugin\\target\\com.microsoft.java.debug.plugin-*.jar"
  VSCODE_JAVA_TEST = HOME .. "\\opensource\\vscode-java-test\\server\\*.jar"
end


local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local bundles = {
  vim.fn.glob(JAVA_DEBUGGER)
};
vim.list_extend(bundles, vim.split(vim.fn.glob(VSCODE_JAVA_TEST), "\n"))

local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-javaagent:" .. JDTLS_LOCATION .. LOMBOK_JAR,
    "-jar", vim.fn.glob(JDTLS_LOCATION .. EQUINOX_JAR),
    "-configuration", JDTLS_LOCATION .. CONFIG .. SYSTEM,
    "-data", HOME .. CACHE .. workspace_dir,
  },

  on_attach = function(client, bufnr)
    require("config.lsp.handlers").on_attach(client, bufnr);
  end,

  capabilities = require("config.lsp.handlers").capabilities,

  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

  settings = {
    java = {},
  },

  init_options = {
    bundles = bundles;
  }
}

require("jdtls").start_or_attach(config)

local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }
keymap("n", "<leader>jo", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
keymap("n", "<leader>jv", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
keymap("n", "<leader>jc", "<Cmd>lua require('jdtls').extract_constant()<CR>", opts)
keymap("n", "<leader>jt", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
keymap("n", "<leader>jT", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
-- keymap("n", "<leader>ju", "<Cmd>JdtUpdateConfig<CR>", opts)

keymap("v", "<leader>jv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
keymap("v", "<leader>jc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", opts)
keymap("v", "<leader>jm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
