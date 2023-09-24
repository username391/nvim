local M = {
	"rcarriga/nvim-notify"
}
M.enabled = true
M.config = function()
	require("notify").setup {
		level = 2,
		minimum_width = 50,
		render = "default",
		stages = "slide",
		timeout = 3000,
		top_down = true,
	}

	vim.notify = require("notify")
end
return M

