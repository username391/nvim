local M = {
	"folke/snacks.nvim",
}

M.enabled = true
M.priority = 1000
M.lazy = false


---@diagnostic disable-next-line: undefined-doc-name
---@type snacks.Config
M.opts = {
	zen = {
		toggles = {
			dim = false,
			git_signs = true,
			diagnostics = true,
			hints = true
		},
		show = {
			statusline = false,
			tabline = true
		},
		win = { style = "zen" },
	},
	bigfile = { enabled = true },
	dashboard = { enabled = true },

	---@class snacks.explorer.Config
	explorer = {
		enabled = true,
		replace_netrw = true,
		trash = true,
	},
	indent = { enabled = true },
	input = { enabled = true },
	notifier = {
		enabled = true,
		timeout = 3000,
	},
	picker = {
		enabled = true,
		sources = {
			explorer = {
				layout = { hidden = { "input" }, layout = { position = "right", } },

				follow_file = true,
				tree = false,
				focus = "list",
				jump = { close = false },
				auto_close = true,
				win = {
					list = {
						keys = {
							["."] = "explorer_focus",
						},
					},
				},
			},
		},
	},
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	styles = {
		notification = {
			-- wo = { wrap = true } -- Wrap notifications
		}
	},
}


return M
