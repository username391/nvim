-- Плагин для подсветки значений цвета в коде

local M = {
	"catgoose/nvim-colorizer.lua", -- original is deprecated
}

M.event = { "BufReadPost", "BufNewFile" }
M.config = function()
	local colorizer = require("colorizer")

	colorizer.setup({
		css = {
			RGB = true,
			RRGGBB = true,
			names = true,
			RRGGBBAA = true,
			rgb_fn = true,
			hsl_fn = true,
			css = true,
			css_fn = true,
		},
		html = { mode = "background" },
		markdown = { names = false },
		"yaml",
		lua = { names = false },
		"*",
	})
end

return M
