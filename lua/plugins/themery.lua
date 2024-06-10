local M = {
	"zaldih/themery.nvim"
}

M.enabled = false
M.config = function ()
	require("themery").setup{
		themes = {
			"catppuccin-latte",
			"catppuccin-frappe",
			"catppuccin-macchiato"
		},
		livePreview = true,
		themeConfigFile = "~/.config/nvim/lua/core/colorsheme.lua"
	}
end

return M

