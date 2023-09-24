local M = {
	"ggandor/lightspeed.nvim"
}

M.enabled = false -- Пока выключу, вроде не пользуюсь
M.config = function ()
	require("lightspeed").setup{
		ignore_case = false,
		exit_after_idle_msecs = { unlabeled = nil, labeled = nil },
	}
end

return M

