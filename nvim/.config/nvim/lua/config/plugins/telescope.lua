return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local builtin = require('telescope.builtin')
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    -- Function to open the selected file in read-only mode
    local function open_read_only(prompt_bufnr)
      local selection = action_state.get_selected_entry()
      if selection and selection.path then
        -- Close Telescope before opening file
        actions.close(prompt_bufnr)
        -- New file is opened in current buffer
        vim.cmd("view " .. vim.fn.fnameescape(selection.path))
        -- Make current buffer readonly
        vim.bo.readonly = true
        vim.bo.modifiable = false
      end
    end

    -- Mapping to open lua files in libraries loaded by lazy in read only mode.
    vim.keymap.set('n', '<leader>en', function()
      builtin.find_files({
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
        attach_mappings = function(_, map)
          map("i", "<CR>", open_read_only)
          map("n", "<CR>", open_read_only)
          return true
        end
      })
    end)

    vim.keymap.set('n', '<leader>ff', function() builtin.find_files({ hidden = true }) end)
    vim.keymap.set('n', '<leader>fg', builtin.git_files)
    vim.keymap.set('n', '<leader>fb', builtin.buffers)
    vim.keymap.set('n', '<leader>fh', builtin.help_tags)
    vim.keymap.set('n', '<leader>lg', builtin.live_grep)
    vim.keymap.set('n', "<leader>ps",
      function()
        builtin.grep_string({ search = vim.fn.input("Grep For > "), hidden = true })
      end
    )

    require('telescope').setup({
      defaults = {
        sorting_strategy = "ascending",
        layout_statergy = "center",
        layout_config = {
          prompt_position = "top",
        },
      },
    })
  end
}
