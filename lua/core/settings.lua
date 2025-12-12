vim.o.encoding = "utf-8"
-- vim.o.termencoding = "cp866"

vim.o.updatetime = 400

vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- editor settings
vim.o.hlsearch = true
vim.o.shell = GetShell()
vim.o.number = true
vim.o.relativenumber = false
vim.o.signcolumn = "number"

-- fold
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
-- vim.o.foldmethod = "indent"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = true

-- disable ~ chars
vim.o.fillchars = "eob: "

vim.opt.termguicolors = true
vim.o.termguicolors = true

-- TransparentBackground = true

vim.cmd("set clipboard+=unnamedplus")
vim.g.mapleader = "<Space>"

vim.filetype.add({
	extension = {
		script = "lua",
	},
})

vim.opt.cmdheight = 0
