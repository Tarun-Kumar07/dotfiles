local saga = require('lspsaga')
-- saga.init_lsp_saga()

local nvim_lsp = require('lspconfig')


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function()
  -- local function buf_set_keymap(...) vim.api.nvim_set_keymap(...) end
  -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- -- Enable completion triggered by <c-x><c-o>
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- -- Mappings.
  -- local opts = { noremap=true, silent=true }

  -- -- See `:help vim.lsp.*` for documentation on any of the below functions

  local noremap = function(key)
    vim.api.nvim_set_keymap("n",key[1],key[2],{noremap = true})
  end

  noremap{'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>'}
  noremap{'gd', '<cmd>lua vim.lsp.buf.definition()<CR>'}
  -- noremap{'K',"<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>"}
  noremap{'K','<cmd>lua vim.lsp.buf.hover()<CR>'}
  noremap{'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>'}
  noremap{'<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>'}
  noremap{'<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>'}
  noremap{'<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>'}
  noremap{'<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>'}
  noremap{'<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>'}
  noremap{'<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>'}
  noremap{'<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>'}
  noremap{'gr', '<cmd>lua vim.lsp.buf.references()<CR>'}
  noremap{'<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>'}
  noremap{'[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>'}
  noremap{']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>'}
  noremap{'<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>'}
  noremap{'<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>'}

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'ccls', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    on_attach = on_attach,
    init_options = {
      formatting = true
    },
    flags = {
      debounce_text_changes = 150,
    },
    --hr7sth cmp 
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
  )
end

