local M = { "nvim-lualine/lualine.nvim" }

M.dependencies = {
	"nvim-tree/nvim-web-devicons",
	"catppuccin/nvim",
}

M.config = function()
	require("lualine").setup({
		options = {
			-- theme = "catppuccin"
			theme = "tokyonight",
		},
	})
end

return M
