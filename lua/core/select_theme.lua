local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"


Themes = {
    { name = "Catppuccin", cmd = "catppuccin-latte", background = "dark" },
    { name = "Catppuccin Latte", cmd = "catppuccin-latte", background = "light" },
    { name = "Catppuccin Frappe", cmd = "catppuccin-frappe", background = "dark" },
    { name = "Catppuccin Macchiato", cmd = "catppuccin-macchiato", background = "dark" },
    { name = "Catppuccin Mocha", cmd = "catppuccin-mocha", background = "dark" },
    { name = "Dracula", cmd = "dracula", background="dark" },
    { name = "Kanagawa Dark", cmd = "kanagawa", background = "dark" },
    { name = "Kanagawa Light", cmd = "kanagawa", background = "light" },
    -- тема Material настраивается по другому, слишком сложно
    -- поэтому пока только одна версия
    { name = "Material", cmd = "material", background = "dark" },
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


local function set_theme(theme)
    vim.o.background = theme.background
    vim.cmd("colorscheme " .. theme.cmd)
    write_theme(theme)
end


function SetThemeFromFile()
    local theme = read_theme()
    if theme then
        set_theme(theme)
    else
        set_theme(Themes[1])
    end
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
        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function ()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                set_theme(Themes[selection.index])
            end)
            return true
        end
    }):find()
end

vim.api.nvim_set_keymap("n", "<Space>t", ":lua PickTheme()<CR>", {noremap = true})
SetThemeFromFile()
