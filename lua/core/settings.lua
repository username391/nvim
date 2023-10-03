vim.o.encoding = "utf-8"
vim.o.termencoding = "cp866"

vim.o.updatetime = 400

vim.o.smartindent = true
vim.o.tabstop     = 4
vim.o.shiftwidth  = 4

-- editor settings
vim.o.hlsearch = true
vim.o.shell = GetShell()
vim.o.number   = true
vim.o.relativenumber = true
vim.o.signcolumn = "number"

-- fold
vim.o.foldmethod = 'indent'
vim.o.foldexpr   = 'nvim_treesitter#foldexpr()'
vim.o.foldenable = false

-- disable ~ chars
vim.o.fillchars='eob: '


vim.opt.termguicolors    = true
vim.o.termguicolors      = true

TransparentBackground = true

