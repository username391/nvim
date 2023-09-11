local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local action_set = require "telescope.actions.set"


Themes = {
    { name = "Catppuccin Latte", cmd = "catppuccin-latte", background = "light" },
    { name = "Catppuccin Frappe", cmd = "catppuccin-frappe", background = "dark" },
    { name = "Catppuccin Macchiato", cmd = "catppuccin-macchiato", background = "dark" },
    { name = "Catppuccin Mocha", cmd = "catppuccin-mocha", background = "dark" },
    { name = "Dracula", cmd = "dracula", background="dark" },
    { name = "Kanagawa Dark", cmd = "kanagawa", background = "dark" },
    { name = "Kanagawa Light", cmd = "kanagawa", background = "light" },
    -- тема Material настраивается по другому, слишком сложно
    -- поэтому пока только одна версия
	-- я пока отключил material, потому что при переключении
	-- темы возникают артефакты
    -- { name = "Material", cmd = "material", background = "dark" },
    { name = "Monokai Pro", cmd = "monokai_pro", background = "dark" },
    { name = "Monokai Soda", cmd = "monokai_soda", background = "dark" },
    { name = "Monokai Ristretto", cmd = "monokai_ristretto", background = "dark" },
    { name = "Moonbow", cmd = "moonbow", background = "dark" },
    { name = "NightFly", cmd = "nightfly", background = "dark" },
    { name = "Nightly", cmd = "nightly", background = "dark" },
    { name = "OneDark", cmd = "onedark", background = "dark" },
    { name = "OneNord Dark", cmd = "onenord", background = "dark" },
    { name = "OneNord Light", cmd = "onenord", background = "light" },
    { name = "PalenightFall", cmd = "palenightfall", background = "dark" },
    { name = "TokyoNight Night", cmd = "tokyonight-night", background = "dark" },
    { name = "TokyoNight Storn", cmd = "tokyonight-storm", background = "dark" },
    { name = "TokyoNight Day ", cmd = "tokyonight-day", background = "light" },
    { name = "TokyoNight Moon", cmd = "tokyonight-moon", background = "dark" },
    { name = "VSCode Light", cmd = "vscode", background = "light" },
    { name = "VSCode Dark", cmd = "vscode", background = "dark" },
}


local function write_theme(theme)
    local file = io.open(vim.fn.stdpath('data') .. 'last_theme', 'w')
    if file then
        local serialized_theme = vim.json.encode(theme)
        file:write(serialized_theme)
        file:close()
        return true
    else
        return false
    end
end


local function read_theme()
    local file = io.open(vim.fn.stdpath('data') .. 'last_theme', 'r')
    if file then
        local serialized_theme = file:read('*a')
        file:close()
        local ok, theme = pcall(vim.json.decode, serialized_theme)
        if ok then
            return theme
        else
            return nil
        end
    else
        return nil
    end
end


local function set_theme(theme, write_to_file)
    vim.o.background = theme.background
    vim.cmd("colorscheme " .. theme.cmd)
	if write_to_file then
		write_theme(theme)
	end
end


function SetThemeFromFile()
    local theme = read_theme()
    if theme then
        set_theme(theme, true)
    else
        set_theme(Themes[1], true)
    end
end


function PreviewTheme(theme)
	set_theme(theme, false)	
end


function PickTheme()
    pickers.new({}, {
        prompt_title = "Select Theme",
        finder = finders.new_table {
            results = Themes,
            entry_maker = function(entry)
                return {
                    display = entry.name,
                    value = entry,
                    ordinal = entry.name
                }
            end,
        },
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function ()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                set_theme(Themes[selection.index])
            end)

			action_set.shift_selection:replace(function (_, change)
				local count = vim.v.count
				count = count == 0 and 1 or count
				count = vim.api.nvim_get_mode().mode == "n" and count or 1
				action_state.get_current_picker(prompt_bufnr):move_selection(change * count)

				local selection = action_state.get_selected_entry()
				PreviewTheme(Themes[selection.index])
			end)

			actions.close:replace(function (_)
				local picker = action_state.get_current_picker(prompt_bufnr)
				local original_win_id = picker.original_win_id
				local cursor_valid, original_cursor = pcall(vim.api.nvim_win_get_cursor, original_win_id)

				actions.close_pum(prompt_bufnr)

				require("telescope.pickers").on_close_prompt(prompt_bufnr)
				pcall(vim.api.nvim_set_current_win, original_win_id)
				if cursor_valid and vim.api.nvim_get_mode().mode == "i" and picker._original_mode ~= "i" then
					pcall(vim.api.nvim_win_set_cursor, original_win_id, { original_cursor[1], original_cursor[2] + 1 })
				end

				SetThemeFromFile()
			end)


			-- mappings
			map("i", "<Esc>", function(prompt_bufnr)
				actions.close(prompt_bufnr)
			end)
            return true
        end,
    }):find()
end

vim.api.nvim_set_keymap("n", "<Space>t", ":lua PickTheme()<CR>", {noremap = true})
SetThemeFromFile()
