local M = {
	"akinsho/toggleterm.nvim"
}
M.module = true
M.cmd = "ToggleTerm"
M.event = { "BufReadPost", "BufNewFile" }

M.config = function()
	local toggleterm = require "toggleterm"

	toggleterm.setup {
		size = 10,
		open_mapping = [[<c-\>]],
		hide_numbers = true,
		shade_terminals = false,
		insert_mappings = true,
		persist_size = true,
		direction = "float",
		close_on_exit = true,
		shell = vim.o.shell,
		autochdir = true,
		highlights = {
			NormalFloat = {
				link = "Normal",
			},
			FloatBorder = {
				link = "FloatBorder",
			},
		},
		float_opts = {
			border = "rounded",
			winblend = 0,
		},
	}
end

return M

