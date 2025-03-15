local builtin = require("telescope.builtin")
local terminal = require("nvterm.terminal")

local noremap = { noremap = true }
local noremap_silent = { noremap = true, silent = true }


local toggle_modes = {'n', 't'}

function close_terminals_and_quit()
	local term = require("nvterm.terminal")

	-- term.send("exit", "horizontal")
	-- term.send("exit", "vertical")
	-- term.send("exit", "float")
	term.close_all_terms()

	print(term.list_active_terms())

	-- vim.api.nvim_command "wqa"
	-- vim.cmd([[ :wqall ]])
end

local function run_file()
	local term = require("nvterm.terminal")
	term.show("horizontal")
	-- term.send("python " .. vim.fn.expand("%"), "horizontal")
end

local mappings = {
	-- Основные комбинации
	-- Сохранить файл
	{ "n", "<C-s>", "<CMD>w!<CR>", noremap },

	-- Сохраняет и проверяет файл в некоторых случаях
	-- FIXME: Тут идея была в том, чтобы написать функцию AfterSave
	-- Которая бы применяла разные функции типа GoFmt для разных файлов,
	-- но этого пока нет. Возможно для этого есть какой то готовый плагин
	-- { "n", "<leader>c", ":w!<CR>lua AfterSave()<CR>", noremap },

	-- Сохраняет все и закрывает nvim
	-- Проблема в том, что это не работает,
	-- когда пользователь находится в сайдбаре или если
	-- открыт nvterm, пока не знаю, как это исправить
	-- FIXME:
	{ "n", "<C-x>", "<CMD>wqall<CR>", noremap },

	-- убрать выделение поиска (команда :noh)
	{ "n", "<S-x>", "<CMD>noh<CR>", noremap },

	-- Удалить текущее слово
	{ "n", "yw", "viwdi", noremap_silent},

	-- Удалить слово начиная с положения курсора
	{ "i", "<C-H>", "<C-W>", noremap },
	{ "n", "<C-H>", "<C-W>", noremap },

	{ "n", "<C-Del>", "ved", noremap },
	{ "i", "<C-Del>", "ved", noremap },


	-- Комбинации для TeleScope --
	-- Поиск по файлам
	{ "n", "<C-p>", builtin.find_files, noremap },

	-- Поиск по старым файлам
	{ "n", "<Space><Space>", builtin.oldfiles, noremap },

	-- LiveGrep (FIXME: выяснить что это :) )
	{ "n", "<Space>fg", builtin.live_grep, noremap },

	-- HelpTags (Тоже пока не знаю что это)
	{ "n", "<Space>fh", builtin.help_tags, noremap },

	-- Текущие буферы
	{ "n", "U", builtin.buffers, noremap },


	-- Комбинации клавиш для nvim-tree --
	-- Ctrl + K - показывает данные файла
	--  Сфокусироваться на сайдбаре
	{ "n", "<C-y>", "<CMD>NvimTreeFocus<CR>",  noremap },

	--  Закрыть/Открыть сайдбар
	{ "n", "<leader>e", "<CMD>NvimTreeToggle<CR>", noremap },

	--  Эта функция делает как будто
	--  то же самое, что и предыдущая,
	--  закрывает/открывает сайдбар
	{ "n", "<C-n>", "<CMD>NvimTreeFindFileToggle<CR>", noremap },


	-- Комбинации клавиш для GoFmt --
	-- Применить функцию GoFmt для текущего файла
	{ "n", "<Space>g", "<CMD>w<CR><CMD>GoFmt<CR>", noremap },


	-- BarBar --
	-- Закрывает текущую вкладку
	{ "n", "<C-w>", "<CMD>bd!<CR><CMD>BufferPrevious<CR>", noremap },

	-- Предыдущая вкладка (буфер)
	{ "n", "<A-,>", "<CMD>BufferPrevious<CR>", noremap_silent },

	-- Следующая вкладка
	{ "n", "<A-.>", "<CMD>BufferNext<CR>", noremap_silent },

	-- Re-order to previous/next (что это значит)
	{ "n", "<A-<>", "<CMD>BufferMovePrevious<CR>", noremap_silent },
	{ "n", "<A->>", "<CMD>BufferMoveNext<CR>", noremap_silent },

	-- Перейти в буфер по номеру
	{ "n", "<A-1>", "<CMD>BufferGo 1<CR>", noremap_silent },
	{ "n", "<A-2>", "<CMD>BufferGo 2<CR>", noremap_silent },
	{ "n", "<A-3>", "<CMD>BufferGo 3<CR>", noremap_silent },
	{ "n", "<A-4>", "<CMD>BufferGo 4<CR>", noremap_silent },
	{ "n", "<A-5>", "<CMD>BufferGo 5<CR>", noremap_silent },
	{ "n", "<A-6>", "<CMD>BufferGo 6<CR>", noremap_silent },
	{ "n", "<A-7>", "<CMD>BufferGo 7<CR>", noremap_silent },
	{ "n", "<A-8>", "<CMD>BufferGo 8<CR>", noremap_silent },
	{ "n", "<A-9>", "<CMD>BufferGo 9<CR>", noremap_silent },
	{ "n", "<A-0>", "<CMD>BufferGo 0<CR>", noremap_silent },

	-- Pin/unpin buffer
	{ "n", "<A-p>", "<CMD>BufferPin<CR>", noremap_silent },

	-- Close buffer
	{ "n", "<A-c>", "<CMD>BufferClose<CR>", noremap_silent },

	-- Wipeout buffer
	-- :BufferWipeout
	-- Close commands
	--                 :BufferCloseAllButCurrent
	--                 :BufferCloseAllButPinned
	--                 :BufferCloseAllButCurrentOrPinned
	--                 :BufferCloseBuffersLeft
	--                 :BufferCloseBuffersRight
	-- Magic buffer-picking mode
	-- { "n", "<C-p>", "<CMD>BufferPick<CR>", noremap_silent },

	-- Сортировка вкладок
	-- по номеру
	{ "n", "<Space>bb", "<CMD>BufferOrderByBufferNumber<CR>", noremap_silent },

	-- по директории
	{ "n", "<Space>bd", "<CMD>BufferOrderByDirectory<CR>", noremap_silent },

	-- по языку
	{ "n", "<Space>bl", "<CMD>BufferOrderByLanguage<CR>", noremap_silent },

	-- по номеру окна
	{ "n", "<Space>bw", "<CMD>BufferOrderByWindowNumber<CR>", noremap_silent },


	-- Git --
	-- git add
	{ "n", "<leader>ga", "GitAdd<CR>", noremap },

	-- git reset
	{ "n", "<leader>gr", "GitReset<CR>", noremap },


	-- Splits --
	{ "n", "zv", ":vsplit<CR>", noremap },
	{ "n", "zh", ":split<CR>",  noremap },
	{ "n", "zc", ":only<CR>",   noremap },

	{ "n", "zrh", ":vertical resize -1<CR>", noremap },
	{ "n", "zrl", ":vertical resize +1<CR>", noremap },
	{ "n", "zrk", ":resize +1<CR>", noremap },
	{ "n", "zrj", ":resize -1<CR>", noremap },

	-- switch between splits
	{ "n", "<c-k>", ":wincmd k<CR>", noremap },
	{ "n", "<c-j>", ":wincmd j<CR>", noremap },
	{ "n", "<c-h>", ":wincmd h<CR>", noremap },
	{ "n", "<c-l>", ":wincmd l<CR>", noremap },


	-- NvTerm --
	{ { "n", "t" }, '<A-h>', function () terminal.toggle('horizontal') end, noremap_silent },
	{ { "n", "t" }, '<A-v>', function () terminal.toggle('vertical') end,   noremap_silent },
	{ { "n", "t" }, '<A-i>', function () terminal.toggle('float') end,      noremap_silent },

	{ "n", "<F5>", '<cmd>lua require("nvterm.terminal").send("python " .. vim.fn.expand("%"), "horizontal")<CR>', noremap },
	-- { "n", "<F5>", run_file, noremap },

	--[[
	-- Навигация для tmux
	vim.api.nvim_set_keymap('n',  'C-l', '<cmd>TmuxNavigateRight<CR>', {})
	vim.api.nvim_set_keymap('n',  'C-j', '<cmd>TmuxNavigateDown<CR>', {})
	vim.api.nvim_set_keymap('n',  'C-k', '<cmd>TmuxNavigateUp<CR>', {})
	]]--

	-- Themery -- 
	{ "n", "<Space>t", "<CMD>Themery<CR>", noremap },


	-- Temp keymaps for mason lsp
	{ "n", "gd", vim.lsp.buf.definition, noremap},


	-- Keymaps for tmux navigation
	{ { "n", "t" }, "<c-h>", "<cmd>TmuxNavigateLeft<cr>", noremap},
	{ { "n", "t" }, "<c-j>", "<cmd>TmuxNavigateDown<cr>", noremap},
	{ { "n", "t" }, "<c-k>", "<cmd>TmuxNavigateUp<cr>", noremap},
	{ { "n", "t" }, "<c-l>", "<cmd>TmuxNavigateRight<cr>", noremap},
	{ { "n", "t" }, "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", noremap},
}


for _, mapping in ipairs(mappings) do
	vim.keymap.set(mapping[1], mapping[2], mapping[3], mapping[4])
end


-- добавляет использование русской клавиатуры для комбинаций клавиш
vim.cmd(":set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz")
