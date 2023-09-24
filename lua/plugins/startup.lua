local headers = {
	hydra = {
		[[                                   ]],
		[[                                   ]],
		-- [[                                   ]],
		[[   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ]],
		[[    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ]],
		[[          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ]],
		[[           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ]],
		[[          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ]],
		[[   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ]],
		[[  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ]],
		[[ ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ]],
		[[ ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ]],
		[[      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ]],
		[[       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ]],
		[[                                   ]],
	},
	neovim = {
		[[                                                     ]],
		[[                                                     ]],
		[[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
		[[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
		[[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
		[[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
		[[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
		[[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
	},
}

local group = vim.api.nvim_create_augroup("Startup", { clear = true })
vim.api.nvim_create_autocmd("FileType", { group = group, pattern = "startup", command = "setlocal list&" })

-- if in a git directory, open git files, otherwise open all files when pressing the "Find File" shortcut
-- local find_command = vim.fn.isdirectory(".git") and "Telescope git_files" or "Telescope find_files"



local M = {
	"startup-nvim/startup.nvim"
}

M.status_line = function()
    local clock = " " .. os.date("%H:%M")
    local date = " " .. os.date("%d.%m.%y")
    return { clock .. " " .. date }
end


M.opts = {
	header = {
		type = "text",
		align = "center",
		fold_section = false,
		title = "Header",
		content = headers.hydra,
		highlight = "Type",
		default_color = ""
	},

	sub_header = {
        type = "text",
        content = M.status_line(),
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Status Line",
        margin = 0,
        highlight = "Variable",
        default_color = "",
        -- oldfiles_amount = 10,
    },

	body = {
		type = "mapping",
		align = "center",
		fold_section = false,
		title = "Basic Commands",
		margin = 0,
		content = {
			{ " Find File", "Telescope find_files", "<C-p>" },
			{ " Find Word", "Telescope live_grep", "<Space>fg" },
			{ " Recent Files", "Telescope oldfiles", "<Space>fo" },
			{ " New File", ":enew", "e" },
		},
		highlight = "Variable",
	},

	body_2 = {
		type = "oldfiles",
		oldfiles_directory = true,
		align = "center",
		fold_section = true,
		title = "Last Files",
		margin = 15,
		content = {},
		highlight = "Variable",
		default_color = "",
		oldfiles_amount = 5,
	},

	footer = {
		type = "text",
		align = "center",
		fold_section = false,
		title = "Footer",
		margin = 5,
		content = { "Слышь работать" },
		highlight = "Number",
		default_color = "",
	},

	colors = {
		background = "#1f2227",
		folded_section = "#FFb6c2",
	},
	mappings = {
		execute_command = "<CR>",
		open_file = "o",
		open_file_split = "<c-o>",
		open_section = "<TAB>",
		open_help = "?",
		quit = "q",
	},

	options = {
		disable_statuslines = true,
		after = function()
			require("startup.utils").oldfiles_mappings()
		end,
		paddings = { 0, 0, 2, 0, 2 },
	},

	parts = { "header", "sub_header", "body", "body_2", "footer" },
}

return M

