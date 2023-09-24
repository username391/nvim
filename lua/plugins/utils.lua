return {
    {
        "folke/neodev.nvim",
        lazy = true,
    },

    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },

    {
        "moll/vim-bbye",
		-- Этот не работает
        cmd = { "Bdelete", "Bwipeout" },
    },

    {
        "iamcco/markdown-preview.nvim",
		lazy = true,
		enabled = true,
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        ft = "markdown",
    },

    {
        "dstein64/vim-startuptime",
        init = function()
            vim.g.startuptime_tries = 5
        end,
        cmd = "StartupTime",
        dependencies = {
            "nvim-lualine/lualine.nvim", -- Just to fix stuck issue on vim-startuptime
        },
    },

	{
		"tpope/vim-fugitive",
		enabled = true,
	},

	{
		"junegunn/gv.vim",
		enabled = true,
		-- GV - commit browser
		-- GV! - commit browser for current file

	},

	{
      'tzachar/local-highlight.nvim',
      config = function()
        require('local-highlight').setup()
      end
	},

	{
		"VonHeikemen/fine-cmdline.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim"
		}
	}
}
