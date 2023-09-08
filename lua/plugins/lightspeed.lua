return {
	"ggandor/lightspeed.nvim",

	config = function ()
		require("lightspeed").setup{
			ignore_case = false,
			exit_after_idle_msecs = { unlabeled = nil, labeled = nil },
		}
	end
}

