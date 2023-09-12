local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local action_set = require "telescope.actions.set"

local switcher = require("core.theme_picker.switcher")


local function select_default(prompt_bufnr)
	local selection = action_state.get_selected_entry()
	switcher.set_theme(switcher.Themes[selection.index], true)
	actions.close(prompt_bufnr)
end


local function shift_selection(prompt_bufnr, change)
	local count = vim.v.count
	count = count == 0 and 1 or count
	count = vim.api.nvim_get_mode().mode == "n" and count or 1
	action_state.get_current_picker(prompt_bufnr):move_selection(change * count)

	local selection = action_state.get_selected_entry()
	switcher.preview_theme(switcher.Themes[selection.index])
end


local function close(prompt_bufnr)
	local picker = action_state.get_current_picker(prompt_bufnr)
	local original_win_id = picker.original_win_id
	local cursor_valid, original_cursor = pcall(vim.api.nvim_win_get_cursor, original_win_id)

	actions.close_pum(prompt_bufnr)
	pickers.on_close_prompt(prompt_bufnr)


	pcall(vim.api.nvim_set_current_win, original_win_id)
	if cursor_valid and vim.api.nvim_get_mode().mode == "i" and picker._original_mode ~= "i" then
		pcall(vim.api.nvim_win_set_cursor, original_win_id, { original_cursor[1], original_cursor[2] + 1 })
	end

	switcher.set_theme_from_file()
end


function PickTheme()
    local picker = pickers.new({}, {
        prompt_title = "Select Theme",
        finder = finders.new_table {
            results = switcher.Themes,
            entry_maker = function(entry)
                return {
                    display = entry.name,
                    value = entry,
                    ordinal = entry.name,
                }
            end,
        },

        attach_mappings = function(_, map)
			actions.select_default:replace(select_default)
   			action_set.shift_selection:replace(shift_selection)
			actions.close:replace(close)

			-- Чтобы при нажатии на esc не переходил в normal mode,
			-- а закрывал telescope
			map("i", "<Esc>", function(prompt_bufnr)
				close(prompt_bufnr)
			end)
            return true
        end,
    })

	picker.default_selection_index = switcher.get_current_theme_index()
	picker:find()
end

