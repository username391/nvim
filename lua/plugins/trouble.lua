local M = {
	"folke/trouble.nvim",
}

M.opts = {
	-- Configuration for trouble.nvim
	auto_close = false,
	auto_open = false,
	auto_preview = true,
	auto_refresh = true,
	use_diagnostic_signs = true,
}

M.cmd = "Trouble"
M.event = "VeryLazy"

M.keys = {
	{
		"<leader>xx",
		"<cmd>Trouble diagnostics toggle<cr>",
		desc = "Diagnostics (Trouble)",
	},
	{
		"<leader>xX",
		"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		desc = "Buffer Diagnostics (Trouble)",
	},
	{
		"<leader>cs",
		"<cmd>Trouble symbols toggle focus=false<cr>",
		desc = "Symbols (Trouble)",
	},
	{
		"<leader>cl",
		"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		desc = "LSP Definitions / references / ... (Trouble)",
	},
	{
		"<leader>xL",
		"<cmd>Trouble loclist toggle<cr>",
		desc = "Location List (Trouble)",
	},
	{
		"<leader>xQ",
		"<cmd>Trouble qflist toggle<cr>",
		desc = "Quickfix List (Trouble)",
	},
}

return M
