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
				name = "Rose Pine (light)",
				colorscheme = "rose-pine",
				before = [[ vim.opt.background = "light" ]]
			},
			{
				name = "Tokyo Night",
				colorscheme = "tokyonight-night",
				before = [[ vim.opt.background = "dark" ]]
			},
			{
				name = "Tokyo Storm",
				colorscheme = "tokyonight-storm",
				before = [[ vim.opt.background = "dark" ]]
			},
			{
				name = "Tokyo Moon",
				colorscheme = "tokyonight-moon",
				before = [[ vim.opt.background = "dark" ]]
			},
			{
				name = "Tokyo Day",
				colorscheme = "tokyonight-day",
				before = [[ vim.opt.background = "light" ]]
			},
		},
		livePreview = true
	})
end

return M
