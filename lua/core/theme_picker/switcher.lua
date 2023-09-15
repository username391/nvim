
local M = {}


M.Themes = {
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
	{ name = "GitHub Dark", cmd = "github_dark", background = "dark" },
	{ name = "GitHub Dark Dimmed", cmd = "github_dark_dimmed", background = "dark" },
	{ name = "GitHub Dark High Contrast", cmd = "github_dark_high_contrast", background = "dark" },
	{ name = "GitHub Dark Colorblind", cmd = "github_dark_colorblind", backgrond = "dark"},
	{ name = "GitHub Dark Tritanopia", cmd = "github_dark_tritanopia", background = "dark" },
	{ name = "GitHub Light", cmd = "github_light", background = "light" },
	{ name = "GitHub Light High Contrast", cmd = "github_light_high_contrast", background = "light" },
	{ name = "GitHub Light Colorblind", cmd = "github_light_colorblind", background = "light" },
	{ name = "GitHub Light Tritanopia", cmd = "github_light_tritanopia", background = "light" },
}


function M.write_theme(theme)
    local file = io.open(vim.fn.stdpath('data') .. '/last_theme', 'w')
    if file then
        local serialized_theme = vim.json.encode(theme)
        file:write(serialized_theme)
        file:close()
        return true
    else
        return false
    end
end


function M.read_theme()
    local file = io.open(vim.fn.stdpath('data') .. '/last_theme', 'r')
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


function M.set_theme(theme, write_to_file)
    vim.o.background = theme.background
    vim.cmd("colorscheme " .. theme.cmd)
	if write_to_file then
		M.write_theme(theme)
	end
end


function M.get_current_theme_index()
	local current_theme = M.read_theme()
	if current_theme == nil then
		return 1
	end
	local counter = 0
	for _, theme in ipairs(M.Themes) do
		counter = counter + 1
		if theme.name == current_theme.name and theme.cmd == current_theme.cmd and theme.background == current_theme.background then
			return counter
		end
	end
	return 1
end


function M.set_theme_from_file()
    local theme = M.read_theme()
    if theme then
        M.set_theme(theme, true)
    else
        M.set_theme(M.Themes[1], true)
    end
end


function M.preview_theme(theme)
	M.set_theme(theme, false)
end

return M
