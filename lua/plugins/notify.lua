return {
	"rcarriga/nvim-notify",
	enabled = true,
	config = function()
		require("notify").setup {
			level = 2,
			minimum_width = 50,
			render = "default",
			stages = "fade",
			timeout = 3000,
			top_down = true,
		}

		vim.notify = require "notify"
	end,
}
