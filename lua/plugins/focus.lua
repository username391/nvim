local M = {
	"nvim-focus/focus.nvim"
}

M.enabled = false
M.version = false

M.config = function ()
	require("focus").setup({
		autoresize = {
			enable = true,
			width = 0,
			height = 0,
			minwidth = 0,
			minheight = 0,
			height_quickfix = 10,
		},
		split = {
			bufnew = false,
			tmux = false,
		},
		ui = {
			number = false,
			relativenumber = false,
			hybridnumber = false,
			absolutenumber_unfocussed = true,

			cursorline = true,
			cursorcolumn = false,
			colorcolumn = {
				enable = false,
				list = '+1',
			},
			signcolumn = true,
			winhighlight = true,
		}
	})
end

return M
