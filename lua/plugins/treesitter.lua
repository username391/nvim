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
			indent = { char = "▏", smart_indent_cap = false }, -- FIXME: maybe smart_indent should be off
			scope = { show_start = false, show_end = false, enabled = true },
			exclude = {
				buftypes = { "terminal", "nofile" },
				filetypes = { "help", "NvimTree" }
			},
			whitespace = { remove_blankline_trail = false }
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

