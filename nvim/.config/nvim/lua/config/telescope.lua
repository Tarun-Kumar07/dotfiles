local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  print("Telescope not installed")
  return
end

local status_ok, themes = pcall(require, "telescope.themes")
if not status_ok then
  print("Telescope themes not installed")
  return
end

local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
  print("Telescope themes not installed")
  return
end

local map = function(key)
  vim.keymap.set("n", key[1], key[2])
end

map({ "<leader>ff", function() builtin.find_files({ hidden = true }) end })
map({ "<leader>fg", function() builtin.git_files() end })
map({ "<leader>lg", function() builtin.live_grep() end })
map({ "<leader>fb", function() builtin.buffers() end })
map({ "<leader>fh", function() builtin.help_tags() end })
map({ "<leader>ps", function() builtin.grep_string({ search = vim.fn.input('Grep For > ') }) end })

--LSP related
map({ "<leader>fs",
  function()
    builtin.lsp_document_symbols({ ignore_symbols = "variable" })
  end })

telescope.setup({
  pickers = {
    lsp_document_symbols = { theme = "dropdown" }
  },
  extensions = {
    ["ui-select"] = {
      themes.get_dropdown(),
      -- ["fzf"] = {
      -- 	fuzzy = true, -- false will only do exact matching
      -- 	override_generic_sorter = true, -- override the generic sorter
      -- 	override_file_sorter = true, -- override the file sorter
      -- 	case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- 	-- the default case_mode is "smart_case"
      -- },
    },
  },
})

-- telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("lsp_handlers")
