return {
	"lewis6991/gitsigns.nvim",
	enabled = true,
	event = { "BufReadPost", "BufNewFile" },

	config = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			signs = {
				add = { text = "+▎" },
				change = { text = "~▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
			},
			attach_to_untracked = false,
			preview_config = {
				-- Options passed to nvim_open_win
				border = "rounded",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		})
	end,
}
