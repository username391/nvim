vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by  = "case_sensitive",
  hijack_cursor = true,
  hijack_netrw = true,
  update_cwd = true,

  disable_netrw = true,
  open_on_tab = true,

  view = {
    hide_root_folder = false,
    side = 'left',
    number = false,
    relativenumber = false
  },
  renderer = {
    indent_markers = { enable = true },
    root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1003), "?:gs?^??" },
    highlight_git = true,
    highlight_opened_files = "none",
    add_trailing = false,
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = { file = true, folder = true, folder_arrow = true, git = true },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = ""
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌"
        }
      }
    }
  },
})


vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    deleted = "",
    ignored = "◌",
    renamed = "➜",
    staged = "✓",
    unmerged = "",
    unstaged = "✗",
    untracked = "★"
  },
  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    empty = "", -- 
    empty_open = "",
    open = "",
    symlink = "",
    symlink_open = ""
  }
}


require("nvim-tree.api").tree.open()

vim.api.nvim_set_keymap('',  '<C-y>',     ':NvimTreeFocus<CR>',          {noremap = true})
vim.api.nvim_set_keymap('',  '<leader>e', ':NvimTreeToggle<CR>',         {noremap = true})
vim.api.nvim_set_keymap('',  '<C-n>',     ':NvimTreeFindFileToggle<CR>', {noremap = true})

vim.g.nvim_tree_auto_open       = 1
vim.g.nvim_tree_auto_close      = 1
vim.g.nvim_tree_follow          = 1
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_ignore          = { '.git', 'node_modules', '.cache', '__pycache__' }
vim.g.nvim_tree_quit_on_open    = 1
vim.g.nvim_tree_tab_open        = 1
