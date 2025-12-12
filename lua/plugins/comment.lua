-- Плагин для комментариев в коде. Не знаю,
-- нужен ли он вообще

return {
	"numToStr/Comment.nvim",
	event = { "BufReadPost", "BufNewFile" },
	lazy = true,
	opts = {},
}
