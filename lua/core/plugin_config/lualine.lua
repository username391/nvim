require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    -- theme = Theme
  },
  sections = {
    lualine_a = {
      'filename',
      -- path = 1,
    }
  }
})
