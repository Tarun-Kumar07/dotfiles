local cmp = require'cmp'
vim.o.completeopt = "menuone,noselect,noinsert"
WIDE_HEIGHT = 40

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` user.
      -- require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` user.
      -- vim.fn["UltiSnips#Anon"](args.body)
    end,
  },

  documentation = {
    --      corner,edge
    --         lu   t     ru   r    rd   b    ld   l
    -- border = { '|', '-', '|', '|', '|', '-', '|', '|' },
    winhighlight = 'NormalFloat:NormalFloat,FloatBorder:NormalFloat',
    maxwidth = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
    maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
  },

  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4), --ctrl + n 
    ['<C-f>'] = cmp.mapping.scroll_docs(4), --ctrl + p
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },

  sources = {
    { name = 'nvim_lsp' },

    -- For vsnip user.
    { name = 'vsnip' },

    -- For luasnip user.
    -- { name = 'luasnip' },

    -- For ultisnips user.
    -- { name = 'ultisnips' },

    { name = 'buffer' },
  }
})
