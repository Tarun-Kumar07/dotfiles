return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  opts = {
    configs = {
      ensure_installed = { 'c', 'lua', 'python' }
    }
  }
}
