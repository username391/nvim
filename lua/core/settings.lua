

-- tabs
vim.o.expandtab   = true
vim.o.smartindent = true
vim.o.tabstop     = 2
vim.o.shiftwidth  = 2

-- editor settings
vim.o.hlsearch = true
vim.o.shell    = 'cmd.exe'
vim.o.number   = true

-- fold
vim.o.foldmethod = 'indent'
vim.o.foldexpr   = 'nvim_treesitter#foldexpr()'
vim.o.foldenable = false

-- disable ~ chars
vim.o.fillchars='eob: '
