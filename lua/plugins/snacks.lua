local M = {
	"folke/snacks.nvim",
}

M.enabled = true
M.priority = 1000
M.lazy = false


---@diagnostic disable-next-line: undefined-doc-name
---@type snacks.Config
M.opts = {
	zen = {
		toggles = {
			dim = false,
			git_signs = true,
			diagnostics = true,
			hints = true
		},
		show = {
			statusline = false,
			tabline = true
		},
		win = { style = "zen" },
	},
	bigfile = { enabled = true },
	dashboard = { enabled = true },
	explorer = {
		enabled = true,
		replace_netrw = true

	},
	indent = { enabled = true },
	input = { enabled = true },
	notifier = {
		enabled = true,
		timeout = 3000,
	},
	picker = {
		enabled = true,
		sources = {
			explorer = {
				layout = { layout = {position = "right"} },
				follow_file = true,
				tree = true,
				focus = "list",
				jump = { close = false },
				auto_close = true,
				win = {
					list = {
						keys = {
							["."] = "explorer_focus",
						},
					},
				},
			},
		},
	},
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	styles = {
		notification = {
			-- wo = { wrap = true } -- Wrap notifications
		}
	},
}


-- M.keys = {
-- 	-- Top Pickers & Explorer
-- }


-- Snacks = require('snacks')
M.init = function()
	vim.api.nvim_create_autocmd("User", {
		pattern = "VeryLazy",
		callback = function()
			-- Setup some globals for debugging (lazy-loaded)
			_G.dd = function(...)
				Snacks.debug.inspect(...)
			end
			_G.bt = function()
				Snacks.debug.backtrace()
			end
			vim.print = _G.dd -- Override print to use snacks for `:=` command

			-- Create some toggle mappings
			Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
			Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
			Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
			Snacks.toggle.diagnostics():map("<leader>ud")
			Snacks.toggle.line_number():map("<leader>ul")
			Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
			Snacks.toggle.treesitter():map("<leader>uT")
			Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
			Snacks.toggle.inlay_hints():map("<leader>uh")
			Snacks.toggle.indent():map("<leader>ug")
			Snacks.toggle.dim():map("<leader>uD")
		end,
	})
end


return M
