local set = vim.opt

set.exrc=true
set.relativenumber=true
set.nu=true
set.hlsearch=false
set.hidden=true
set.errorbells=false
set.tabstop=2 softtabstop=2
set.shiftwidth=2
set.expandtab=true
set.smartindent=true
set.wrap=false
set.backup=false
set.undodir='~/.vim/undodir'
set.incsearch=true
set.scrolloff=7
set.showmode=false
set.colorcolumn='100'
--highlight ColorColum ctermbg=0 guibg=lightgrey
set.signcolumn='yes'

--highlights cursor line number
set.cursorline=true
set.cursorlineopt='number'

--Give more space for displaying messages
set.cmdheight=2

--Reducing updatetime for faster experience
set.updatetime=50

--Don't pass messages to |ins-completion-menu|.
set.shortmess = set.shortmess + 'c'

--Interacting with system clipboard
set.clipboard = 'unnamed'
set.clipboard = set.clipboard + 'unnamedplus'
