set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact','substring','fuzzy']

"Adding servers
lua << EOF
  require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
  --For installing ccls
  --https://jdhao.github.io/2020/11/29/neovim_cpp_dev_setup/
  -- or https://snapcraft.io/install/ccls/ubuntu 
  require'lspconfig'.ccls.setup{on_attach=require'completion'.on_attach}
EOF
