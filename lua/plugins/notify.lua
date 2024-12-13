-- Плагин для уведомлений
local M = {
	"rcarriga/nvim-notify"
}
M.enabled = true
M.config = function()
	require("notify").setup {
		level = 2,
		minimum_width = 50,
		render = "wrapped-compact",
		stages = "slide",
		timeout = 1300,
		top_down = true,
		max_width = 500,
		max_height = 100,
	
	}

	vim.notify = require("notify")
end
return M

