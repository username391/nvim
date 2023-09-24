local M = {
	"stevearc/dressing.nvim"
}

M.enabled = true
M.config = function()
	require("dressing").setup {
		input = {
			win_options = {
				winblend = 0
			}
		},
		select = {
			telescope = {
				previewer = false,
				borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
				layout_strategy = "vertical",
				layout_config = {
					height = 0.6,
				},
				prompt_prefix = " ",
				sorting_strategy = "ascending",
			},
		},
	}
end
return M
