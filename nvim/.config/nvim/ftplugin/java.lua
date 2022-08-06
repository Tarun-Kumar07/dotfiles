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
  SYSTEM = "linux"
  HOME = os.getenv("$HOME")
  JDTLS_LOCATION = vim.fn.stdpath("data") .. "/lsp_servers/jdtls"
  LOMBOK_JAR = "/lombok.jar"
  EQUINOX_JAR = "/plugins/org.eclipse.equinox.launcher_*.jar"
  CONFIG = "/config"
  CACHE = "/.cache/"
else
  SYSTEM = "win"
  HOME = os.getenv("USERPROFILE")
  JDTLS_LOCATION = vim.fn.stdpath("data") .. "\\lsp_servers\\jdtls"
  LOMBOK_JAR = "\\lombok.jar"
  EQUINOX_JAR = "\\plugins\\org.eclipse.equinox.launcher_*.jar"
  CONFIG = "\\config_"
  CACHE = "\\.cache\\"
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

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

  on_attach = require("config.lsp.handlers").on_attach,
  capabilities = require("config.lsp.handlers").capabilities,

  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

  settings = {
    java = {},
  },
}

require("jdtls").start_or_attach(config)
