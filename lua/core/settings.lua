vim.g.mapleader = "<Space>" -- sets leaders key

-- NOTE: NETRW
vim.g.netrw_banner = 0 -- gets rid of annoying netrw banner
vim.g.netrw_browser_split = 4 -- open in prior window
vim.g.netrw_altv = 1 -- change from left splitting to right
vim.g.netrw_liststyle = 3 -- tree style view in netrw

vim.opt.title = true -- show title
vim.cmd("set path+=**") -- search current dir recursively
vim.opt.syntax = "ON"
vim.opt.backup = false
vim.opt.compatible = false -- turns off vi compatibility mode
vim.opt.number = true -- line numbers on
vim.opt.relativenumber = false -- i dont need relative line numbers
vim.opt.mouse = "a" -- mouse enable in all modes
vim.opt.ignorecase = true -- case insensitive search on
vim.opt.smartcase = true -- all searches are case insensitive
vim.opt.hlsearch = true -- search highlight
vim.opt.incsearch = true -- enable incremental searching
vim.opt.wrap = false -- text wrapping NOTE: maybe i actually need this, i dont know
vim.opt.tabstop = 4 -- tab size
vim.opt.shiftwidth = 4
vim.opt.encoding = "utf-8" -- default text encoding
-- vim.opt.termencoding = "cp866"
vim.opt.pumheight = 10 -- number of items in popup menu
vim.opt.showtabline = 2 -- always show the tabs line
vim.opt.laststatus = 2 -- always show status bar (originally was 3)
vim.opt.signcolumn = "auto" -- originally was "number"
vim.opt.expandtab = false -- expand tab
vim.opt.smartindent = true
vim.opt.showcmd = true
vim.opt.cmdheight = 2 -- set to 0 to hide line under statusbar
vim.opt.showmode = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17" -- скопировал у кого то, наверное для гуи версии, хз
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.splitbelow = true -- split go below
vim.opt.splitright = true -- vertical split to the right
vim.opt.termguicolors = true
-- vim.o.termguicolors = true

-- vim.opt.clipboard = unnamedplus
vim.cmd("set clipboard+=unnamedplus")

vim.o.updatetime = 400

-- editor settings
vim.o.shell = GetShell()

-- fold
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
-- vim.o.foldmethod = "indent"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = true

-- disable ~ chars
vim.o.fillchars = "eob: "

vim.filetype.add({
	extension = {
		script = "lua",
	},
})

vim.o.winborder = "rounded"
