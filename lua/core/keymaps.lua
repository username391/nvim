vim.api.nvim_set_keymap('n', '<C-s>',     ':w<CR>',                                    {noremap = true})

vim.api.nvim_set_keymap('',  '<C-r>',     ':w<CR>:botright sp<CR>:term! python %<CR>', {noremap = true})
vim.api.nvim_set_keymap('',  '<C-w>',     ':bd!<CR>',                                  {noremap = true})
vim.api.nvim_set_keymap('',  '<C-i>',     ':botright sp<CR>:term! ipython<CR>',        {noremap = true})

vim.api.nvim_set_keymap('',  '<C-x>',     ':wqa<CR>',                                  {noremap = true})
