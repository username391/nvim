local M = {
	"karb94/neoscroll.nvim"
}

M.enabled = false
M.event = buffer_with_content_events

M.config = function ()
	local neoscroll = require('neoscroll')

	local keymap = {
		['<C-b>'] = function() neoscroll.ctrl_b({ duration = 350 }) end,
		['<C-f>'] = function() neoscroll.ctrl_f({ duration = 350 }) end,
		['<PageUp>'] = function() neoscroll.ctrl_b({ duration = 350 }) end,
		['<PageDown>'] = function() neoscroll.ctrl_b({ duration = 350 }) end,

		-- ['<C-u>'] = function() neoscroll.scroll({ duration = 250 }) end,
		-- ['<C-d>'] = function() neoscroll.ctrl_b({ duration = 250 }) end,

		['zt'] = function() neoscroll.zt({ half_win_duration = 350 }) end,
		['zz'] = function() neoscroll.zz({ half_win_duration = 350 }) end,
		['zb'] = function() neoscroll.zb({ half_win_duration = 350 }) end,
	}
end

return M
