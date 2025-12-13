local M = {
	"mozanunal/sllm.nvim",
	enabled = false,
}

M.lazy = false

M.dependencies = {
	"echasnovski/mini.notify",
	"echasnovski/mini.pick",
}

M.config = function()
	require("sllm").setup({
		llm_cmd = "llm", -- command or path for the llm CLI
		default_model = "default", -- default llm model (set to "default" to use llm's default model)
		show_usage = true, -- append usage stats to responses
		on_start_new_chat = true, -- start fresh chat on setup
		reset_ctx_each_prompt = true, -- clear file context each ask
		window_type = "vertical", -- Default. Options: "vertical", "horizontal", "float"
		-- function for item selection (like vim.ui.select)
		pick_func = require("mini.pick").ui_select,
		-- function for notifications (like vim.notify)
		notify_func = require("mini.notify").make_notify(),
		-- function for inputs (like vim.ui.input)
		input_func = vim.ui.input,
		-- See the "Customizing Keymaps" section for more details
		keymaps = {
			-- Change a default keymap
			-- ask_llm = "<space>a",
			-- Disable a default keymap
			add_url_to_ctx = false,
			-- Other keymaps will use their default values
		},
	})
end

return M
