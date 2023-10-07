local M = {
	"nvim-treesitter/nvim-treesitter"
}

M.module = true
M.event = { "BufReadPost", "BufNewFile" }
M.cmd = {
	"TSInstall",
	"TSInstallInfo",
	"TSUpdate",
	"TSBufEnable",
	"TSBufDisable",
	"TSEnable",
	"TSDisable",
	"TSModuleInfo",
}

M.dependencies = {
	--"JoosepAlviste/nvim-ts-context-commentstring",
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			char = "▏",
			show_trailing_blankline_indent = false,
			show_first_indent_level = true,
			use_treesitter = true,
			show_current_context = true,
			buftype_exclude = { "terminal", "nofile" },
			filetype_exclude = {
				"help",
				"NvimTree",
			},
		},
	},
}

M.build = ":TSUpdate"
M.config = function()
	local configs = require "nvim-treesitter.configs"

	configs.setup {
		ensure_installed = { "cpp", "lua", "c", "go", "python" }, -- one of "all" or a list of languages
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = "", -- list of language that will be disabled
		},
		autopairs = {
			enable = true,
		},
		indent = { enable = false, disable = {} },
	}
end
return M

