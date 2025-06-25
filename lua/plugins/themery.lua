local M = {
	"zaldih/themery.nvim"
}

M.config = function()
	local themery = require("themery")
	themery.setup({
		themes = {
			{
				name = "Catppuccin Latte",
				colorscheme = "catppuccin-latte",
				before = [[ vim.opt.background = "light" ]],
				after = [[  ]]
			},
			{
				name = "Catppuccin Frappe",
				colorscheme = "catppuccin-frappe",
				before = [[ vim.opt.background = "dark" ]]
			},
			{
				name = "Catppuccin Macchiato",
				colorscheme = "catppuccin-macchiato",
				before = [[ vim.opt.background = "dark" ]]
			},
			{
				name = "Catppuccin Mocha",
				colorscheme = "catppuccin-mocha",
				before = [[ vim.opt.background = "dark" ]]
			},
			{
				name = "Rose Pine",
				colorscheme = "rose-pine",
				before = [[ vim.opt.background = "dark" ]]
			},
			{
				name = "Rose Pine Moon",
				colorscheme = "rose-pine-moon",
				before = [[ vim.opt.background = "dark" ]]
			},
			{
				name = "Rose Pine Dawn",
				colorscheme = "rose-pine-dawn",
				before = [[ vim.opt.background = "light" ]]
			},
		},
		livePreview = true
	})
end

return M
