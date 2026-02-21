local M = { "nvim-lualine/lualine.nvim" }

M.dependencies = {
	"nvim-tree/nvim-web-devicons",
	"catppuccin/nvim",
}

M.config = function()
	require("lualine").setup({
		options = {
			theme = "catppuccin",
			-- theme = "tokyonight",
			disabled_filetypes = {
				statusline = { "snacks*", "snacks_picker", "snacks_dashboard" },
				winbar = { "snacks_picker_list" },
			},
		},
	})
end

return M
