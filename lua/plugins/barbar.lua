-- Плагин для вкладок. Я до сих пор не определился
-- нужен ли он мне

local M = {
	'romgrk/barbar.nvim'
}

M.enabled = true

M.config = function()
	require("barbar").setup {
		auto_hide = true,
		animation = true,
		separator = {left = "▎|", right = ""},
		--separator = {left = "", right = ""},
	}
end

return M
