return {
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("plugins.themes.catppuccin")
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		priority = 1000,
		config = function()
			require("plugins.themes.rose-pine")
		end,
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = true,
		priority = 1000,
		config = function()
			require("plugins.themes.tokyonight")
		end,
	},
}
