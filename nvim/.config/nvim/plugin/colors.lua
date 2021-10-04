-- vim.cmd([[autocmd VimEnter * hi Normal ctermbg=none]])
-- function nvim_create_augroups(definitions)
--   for group_name, definition in pairs(definitions) do
--     vim.api.nvim_command('augroup '..group_name)
--     vim.api.nvim_command('autocmd!')
--     for _, def in ipairs(definition) do
--       local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
--       vim.api.nvim_command(command)
--     end
--     vim.api.nvim_command('augroup END')
--   end
-- end

-- local autocmds = {
--   startup = {
--     {"VimEnter", "*", [[hi Normal ctermbg=none]]};
--   }
-- }

-- nvim_create_augroups(autocmds)
vim.cmd([[colorscheme gruvbox]])
vim.api.nvim_set_var([[gruvbox_transparent_bg]],1)
vim.opt.background='dark'
