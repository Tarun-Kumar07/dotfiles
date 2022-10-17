local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

vim.opt.termguicolors = true

bufferline.setup {
  options = {
    -- separator_style = "padded_slant",
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    },
  },
  highlights = {
    buffer = {
      fg = "#1d2021",
      bg = "#1d2021"
    },
    separator_selected = {
      fg = "#1d2021",
      bg = "#1d2021"
    },
    separator_visible = {
      fg = "#1d2021",
      bg = "#1d2021",
    },
    separator = {
      fg = "#1d2021",
      bg = "#1d2021",
    },
  }
}
