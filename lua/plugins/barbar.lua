return {
	'romgrk/barbar.nvim',
	enabled = true,
	opts = {
		auto_hide = true,
		animation = true,

		icons = {
			buffer_index = false,
			buffer_number = false,
			button = '',

			gitsigns = {
				added = { enabled = true, icon = '+' },
				changed = { enabled = true, icon = '~' },
				deleted = { enabled = true, icon = '-' },
			},

			filetype = {
				custom_colors = false,
				enabled = true,
			},
			separator = { left = '▎', right = '' },

			-- If true, add an additional separator at the end of the buffer list
			separator_at_end = true,

			-- Configure the icons on the bufferline when modified or pinned.
			-- Supports all the base icon options.
			modified = { button = '●' },
			pinned = { button = '', filename = true },

			-- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
			preset = 'default',

			-- Configure the icons on the bufferline based on the visibility of a buffer.
			-- Supports all the base icon options, plus `modified` and `pinned`.
			alternate = { filetype = { enabled = false } },
			current = { buffer_index = true },
			-- inactive = { button = '×' },
			visible = { modified = { buffer_number = false } },
		},
	}
}
