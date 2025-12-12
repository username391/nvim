return {
	"folke/snacks.nvim",
	enabled = true,
	priority = 1000,
	lazy = false,

	---@diagnostic disable-next-line: undefined-doc-name
	---@type snacks.config
	opts = {

		zen = {
			toggles = {
				dim = false,
				git_signs = true,
				diagnostics = true,
				hints = true,
			},
			show = {
				statusline = false,
				tabline = true,
			},
			win = { style = "zen" },
		},
		bigfile = { enabled = true },
		dashboard = { enabled = true },

		---@class snacks.explorer.config
		explorer = {
			enabled = true,
			replace_netrw = true,
			trash = true,
		},
		indent = { enabled = false },
		input = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		picker = {
			enabled = true,
			sources = {
				explorer = {
					layout = { hidden = { "input" }, layout = { position = "right" } },

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

		---@class snacks.statuscolumn.config
		---@field left snacks.statuscolumn.components
		---@field right snacks.statuscolumn.components
		---@field enabled? boolean
		statuscolumn = {
			enabled = true,
			left = { "mark", "sign" }, -- priority of signs on the left (high to low)
			right = { "fold", "git" }, -- priority of signs on the right (high to low)
			folds = {
				open = true, -- show open fold icons
				git_hl = false, -- use git signs hl for fold icons
			},
			git = {
				patterns = { "gitsign", "minidiffsign" },
			},
			refresh = 50,
		},
		words = { enabled = true },
		styles = {
			notification = {
				wo = { wrap = true }, -- wrap notifications
			},
		},
	},
}
