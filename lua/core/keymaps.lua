local noremap = { noremap = true }


-- Комбинации клавиш для nvim-tree
-- Ctrl + K - показывает данные файла
--  Сфокусироваться на сайдбаре
vim.api.nvim_set_keymap("n", "<C-y>", ":NvimTreeFocus<CR>", noremap)

--  Закрыть/Открыть сайдбар
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", noremap)

--  Эта функция делает как будто
--  то же самое, что и предыдущая,
--  закрывает/открывает сайдбар
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", noremap)


-- Сохраняет файл
vim.api.nvim_set_keymap("n", "<C-s>", ":w!<CR>", noremap)

-- Закрывает текущую вкладку
vim.api.nvim_set_keymap("n", "<C-w>", ":bd!<CR><Cmd>BufferPrevious<CR>", noremap)

-- Сохраняет все и закрывает nvim
-- Проблема в том, что это не работает,
-- когда пользователь находится в сайдбаре
-- Пока не знаю, как это исправить
vim.api.nvim_set_keymap("n", '<C-x>', ':wqa<CR>', noremap)

-- убрать выделение поиска
vim.api.nvim_set_keymap("n", '<C-h>', ':noh<CR>', noremap)

--[[
-- Навигация для tmux
vim.api.nvim_set_keymap('n',  'C-l', '<cmd>TmuxNavigateRight<CR>', {})
vim.api.nvim_set_keymap('n',  'C-j', '<cmd>TmuxNavigateDown<CR>', {})
vim.api.nvim_set_keymap('n',  'C-k', '<cmd>TmuxNavigateUp<CR>', {})
]]--



-- тут по сути только комбинации клавиш
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<c-p>",          builtin.find_files, {})
vim.keymap.set("n", "<Space><Space>", builtin.oldfiles,   {})
vim.keymap.set("n", "<Space>fg",      builtin.live_grep,  {})
vim.keymap.set("n", "<Space>fh",      builtin.help_tags,  {})

-- BarBar
vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true})

-- Re-order to previous/next
vim.keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", { noremap = true, silent = true})

-- Goto buffer in position...
vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", { noremap = true, silent = true})

-- Pin/unpin buffer
vim.keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>", { noremap = true, silent = true})

-- Close buffer
vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", { noremap = true, silent = true})

-- Wipeout buffer
-- :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
-- map("n", "<C-p>", "<Cmd>BufferPick<CR>", { noremap = true, silent = true})

-- Sort automatically by...
vim.keymap.set("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", { noremap = true, silent = true})


vim.keymap.set("n", "<leader>ga", ":lua GitAdd()<CR>")
vim.keymap.set("n", "<leader>gr", ":lua GitReset()<CR>")
--vim.keymap.set("n", "<Space>i", ":lua Test()<CR>")
