-- Нужно будет установить fzf для нечеткого поиска

local M = {
	"nvim-telescope/telescope.nvim"
}
M.module = true
M.cmd = "Telescope"
M.dependencies = {
	-- {
	-- 	"nvim-telescope/telescope-fzf-native.nvim", as = "fzf",
	-- 	build = ":make",
	-- },
}

M.config = function()
	local telescope = require "telescope"
	local actions = require "telescope.actions"

	local pickers = {
		buffers = {
			ignore_current_buffer = true,
			sort_lastused = true,
			prompt_title = "Opened Files",
		},

		oldfiles = {
			prompt_title = "Recent Files",
		},
	}

	local extensions = {
		-- fzf = {
			--     fuzzy = true, -- false will only do exact matching
			--     override_generic_sorter = true, -- override the generic sorter
			--     override_file_sorter = true, -- override the file sorter
			--     case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			--     -- the default case_mode is "smart_case"
			-- },
		}

	telescope.setup {
		defaults = {
			layout_config = {
				width = 0.8,
				prompt_position = "bottom",
				preview_cutoff = 120,
				horizontal = { mirror = false },
				vertical = { mirror = false },
			},
			layout_strategy = "horizontal",
			winblend = 0,
			selection_strategy = "reset",
			sorting_strategy = "ascending",
			prompt_prefix = "  ",
			selection_caret = "󱞩 ",
			path_display = { "smart" },
			file_ignore_patterns = { ".git", ".ruff", "node_modules", "__pycache__" },

			mappings = {
				i = {
					["<A-j>"] = actions.move_selection_next,
					["<A-k>"] = actions.move_selection_previous,
					["<Tab>"] = actions.move_selection_next,
					["<S-Tab>"] = actions.move_selection_previous,
					["<Esc>"] = actions.close,
					[";"] = actions.close,
				},
				-- n = {},
			},
		},
		pickers = pickers,
		extensions = extensions,
	}

	-- To get fzf loaded and working with telescope, you need to call
	-- load_extension, somewhere after setup function:
	-- telescope.load_extension "fzf"
end

return M

