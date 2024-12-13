return {
    {
        "Alexis12119/nightly.nvim",
        -- lazy = true,
        priority = 1000,
        config = function()
            require "plugins.themes.nightly"
        end,
    },

    {
        "marko-cerovac/material.nvim",
        lazy = true,
        config = function()
            vim.g.material_style = "deep ocean"
            require "plugins.themes.material"
        end,
    },

    {
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require "plugins.themes.tokyonight"
        end,
    },

    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        priority = 1000,
        config = function()
            require "plugins.themes.catppuccin"
        end,
    },

    {
        "rebelot/kanagawa.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require "plugins.themes.kanagawa"
        end,
    },

    {
        "arturgoms/moonbow.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require "plugins.themes.moonbow"
        end,
    },

    {
        "rmehri01/onenord.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require "plugins.themes.onenord"
        end,
    },

    {
        "Mofiqul/vscode.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require "plugins.themes.vscode"
        end,
    },

    {
        "navarasu/onedark.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require "plugins.themes.onedark"
        end,
    },

    {
        "tanvirtin/monokai.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require "plugins.themes.monokai"
        end,
    },

    {
        "Mofiqul/dracula.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require "plugins.themes.dracula"
        end,
    },

    {
        "JoosepAlviste/palenightfall.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require "plugins.themes.palenightfall"
        end,
    },

    {
        "bluz71/vim-nightfly-colors",
        lazy = true,
        priority = 1000,
        config = function()
            require "plugins.themes.nightfly"
        end,
    },
	{
		"projekt0n/github-nvim-theme",
		lazy = true,
		priority = 1000,
		config = function ()
			require 'plugins.themes.github-theme'
		end,
	},

	{
		'rose-pine/neovim',
		name = 'rose-pine',
		lazy = true,
		priority = 1000,
		config = function ()
			require 'plugins.themes.rose-pine'
		end
	}
}
