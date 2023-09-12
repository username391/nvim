M = require('core.theme_picker.switcher')
require('core.theme_picker.picker')


vim.api.nvim_set_keymap("n", "<Space>t", ":lua PickTheme()<CR>", {noremap = true})
M.set_theme_from_file()
