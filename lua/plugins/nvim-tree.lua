local M = {
	"nvim-tree/nvim-tree.lua"
}

M.module = true
M.cmd = {
	"NvimTreeOpen",
	"NvimTreeToggle",
	"NvimTreeFocus",
	"NvimTreeFindFile",
	"NvimTreeFindFileToggle",
}
M.dependencies = {
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			local icons = require "nvim-web-devicons"

			icons.set_icon {
				deb = { icon = "", name = "Deb", color = "#A1B7EE" },
				lock = { icon = "", name = "Lock", color = "#C4C720" },
				mp3 = { icon = "󰎈", name = "Mp3", color = "#D39EDE" },
				mp4 = { icon = "", name = "Mp4", color = "#9EA3DE" },
				out = { icon = "", name = "Out", color = "#ABB2BF" },
				["robots.txt"] = { icon = "ﮧ", name = "Robots", "#ABB2BF" },
				[""] = { icon = "", name = "default", "#ABB2Bf" },
				ttf = { icon = "", name = "TrueTypeFont", "#ABB2Bf" },
				rpm = { icon = "", name = "Rpm", "#FCA2Aa" },
				woff = { icon = "", name = "WebOpenFontFormat", color = "#ABB2Bf" },
				woff2 = { icon = "", name = "WebOpenFontFormat2", color = "#ABB2Bf" },
				xz = { icon = "", name = "Xz", color = "#519ABa" },
				zip = { icon = "", name = "Zip", color = "#F9D71c" },
				snippets = { icon = "", name = "Snippets", color = "#51AFEf" },
				ahk = { icon = "", name = "AutoHotkey", color = "#51AFEf" },
			}
		end,
	},
}
M.config = function()
	local nvim_tree = require "nvim-tree"

	nvim_tree.setup {
		disable_netrw = false,
		auto_reload_on_write = false,
		diagnostics = {
			enable = false,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		update_focused_file = {
			enable = true,
			update_cwd = false, -- как же это сука раздражает
			ignore_list = {},
		},
		renderer = {
			root_folder_label = false,
			icons = {
				glyphs = {
					default = "",
					symlink = "",
					folder = {
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
					},
					git = {
						unstaged = "",
						staged = "S",
						unmerged = "",
						renamed = "➜",
						deleted = "",
						untracked = "u",
						ignored = "◌",
					},
				},
			},
		},
		actions = {
			use_system_clipboard = true,
			change_dir = {
				enable = false,
				global = false,
				restrict_above_cwd = false,
			},
		},
		view = {
			cursorline = false,
			float = {
				enable = false,
				quit_on_focus_loss = true,
				open_win_config = {
					relative = "editor",
					border = "rounded",
					width = 30,
					height = 30,
					row = 1,
					col = 1,
				},
			},
			-- hide_root_folder = true,
		},
		filters = {
			dotfiles = true,
		}
	}
end

return M
