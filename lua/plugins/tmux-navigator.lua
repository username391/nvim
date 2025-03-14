local M = {
	"christoomey/vim-tmux-navigator",
}

M.enabled = true
M.lazy = false

M.cmd = {
	"TmuxNavigateLeft",
	"TmuxNavigateDown",
	"TmuxNavigateUp",
	"TmuxNavigateRight",
	"TmuxNavigatePrevious",
	"TmuxNavigatorProcessList",
}


return M
