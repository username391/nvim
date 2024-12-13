-- Плагин для комментариев в коде. Не знаю,
-- нужен ли он вообще

local M = {
	"numToStr/Comment.nvim"
}
M.event = { "BufReadPost", "BufNewFile" }
M.lazy = true
M.opts = {}

return M
