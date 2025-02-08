return {
  "catppuccin/nvim",
  name = "catppuccin",
  version = "stable",
  priority = 1000, -- Priorty is set to max so that colour scheme is loaded first
  config = function()
    require("catppuccin").setup({
      transparent_background = true
    })
    vim.cmd([[colorscheme catppuccin]])
  end,
}
