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
        cmd = { "Bdelete", "Bwipeout" },
    },

    {
        "iamcco/markdown-preview.nvim",
		lazy = true,
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
        "stevearc/dressing.nvim",
        enabled = true,
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

	}
}
