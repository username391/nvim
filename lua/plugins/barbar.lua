local M = {
	'romgrk/barbar.nvim'
}

M.enabled = false

M.config = function()
	require("barbar").setup {
		auto_hide = true,
		animation = true,
		separator = {left = "▎|", right = ""},
		--separator = {left = "", right = ""},
	}
end

return M

