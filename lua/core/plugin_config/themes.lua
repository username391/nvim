local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

ThemesTable = {
  'TokyoNight Storm',
  'TokyoNight Night',
  'TokyoNight Moon',
  'TokyoNight Day',
  'GruvBox Light',
  'GruvBox Dark'
}

Theme = "tokyonight"

vim.opt.termguicolors    = true
vim.o.termguicolors      = true


local function starts_with(str, start)
   return str:sub(1, #start) == start
end

local function ends_with(str, ending)
   return ending == "" or str:sub(-#ending) == ending
end

function SwitchTheme(theme)
  local style = ''
  local new_theme = ''

  vim.o.background = 'dark'

  if starts_with(theme, 'TokyoNight') then
    if ends_with(theme, 'Storm') then style = 'storm'
    elseif ends_with(theme, 'Night') then style = 'night'
    elseif ends_with(theme, 'Moon') then style = 'moon'
    elseif ends_with(theme, 'Day') then style = 'day'
    else style = 'storm'
    end

    require('tokyonight').setup({
      transparent = false,
      style       = style,
      styles      = {
        comments  = { italic = true },
        keywords  = { italic = true },
        functions = {},
        variables = {},
      }
    })
    new_theme = 'tokyonight'
  elseif starts_with(theme, 'GruvBox') then
    if ends_with(theme, 'Light') then style = 'light'
    else style = 'dark'
    end

    require("gruvbox").setup({
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true,
      contrast = "", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    })

    vim.o.background = style
    new_theme = 'gruvbox'
  end
  vim.cmd("colorscheme " .. new_theme)
  Theme = new_theme
 end


function SelectTheme()
  pickers.new({}, {
    prompt_title = "Select Theme",
    finder = finders.new_table {
      -- results = {"tokyonight", "gruvbox"}
      results = ThemesTable
    },
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function ()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        SwitchTheme(ThemesTable[selection.index])
      end)
      return true
    end
  }):find()
end

vim.api.nvim_set_keymap('n', '<Space>t', ':lua SelectTheme()<CR>', {noremap = true})

SwitchTheme(ThemesTable[1])
