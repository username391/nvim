require('nvim-treesitter.configs').setup({
  ensure_installed = { 'c', 'lua', 'rust', 'vim', 'python', 'go' },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true
  }
})
