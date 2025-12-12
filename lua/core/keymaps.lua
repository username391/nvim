local builtin = require("telescope.builtin")
local terminal = require("nvterm.terminal")

-- насколько правильно делать это здесь
-- не влияет ли это на скорость?
local snacks = require("snacks")
local spick = require("snacks.picker")
-- local neoscroll = require("neoscroll")

local noremap = { noremap = true }
local noremap_silent = { noremap = true, silent = true }

-- FIXME: эта функция задумывалась как функция, которая будет
-- выполняться при закрытии программы. Она должна перед закрытием закрыть все
-- терминалы. Очеведно она не работает, нужно будет либо переписать,
-- либо удалить
function Close_terminals_and_quit()
	local term = require("nvterm.terminal")

	-- term.send("exit", "horizontal")
	-- term.send("exit", "vertical")
	-- term.send("exit", "float")
	term.close_all_terms()

	print(term.list_active_terms())

	-- vim.api.nvim_command "wqa"
	-- vim.cmd([[ :wqall ]])
end

-- TODO: Эту функцию нужно переименовать, перенести в другой файл
-- и переписать нормально. Сейчас она не используется
local function run_file()
	local term = require("nvterm.terminal")
	term.show("horizontal")
	-- term.send("python " .. vim.fn.expand("%"), "horizontal")
end

--  FIXME: Короче, я просто втупую заменил <leader>
--  на <Space>, потому что vim.g.mapleader почему то
--  не дает нужного результата, пробел как leader не
--  работает. Нужно поискать решение
local mappings = {
	-- Основные комбинации
	-- Сохранить файл
	{
		"n",
		"<C-s>",
		"<CMD>w!<CR>",
		noremap,
	},

	-- Сохраняет и проверяет файл в некоторых случаях
	-- FIXME: Тут идея была в том, чтобы написать функцию AfterSave
	-- Которая бы применяла разные функции типа GoFmt для разных файлов,
	-- но этого пока нет. Возможно для этого есть какой то готовый плагин
	-- { "n", "<Space>c", ":w!<CR>lua AfterSave()<CR>", noremap },

	-- Сохраняет все и закрывает nvim
	-- Проблема в том, что это не работает,
	-- когда пользователь находится в сайдбаре или если
	-- открыт nvterm, пока не знаю, как это исправить
	-- FIXME:
	{
		"n",
		"<C-x>",
		"<CMD>wqall<CR>",
		noremap,
	},

	-- убрать выделение поиска (команда :noh)
	{
		"n",
		"<S-x>",
		"<CMD>noh<CR>",
		noremap,
	},

	-- Удалить текущее слово
	{
		"n",
		"yw",
		"viwdi",
		noremap_silent,
	},

	-- Удалить слово начиная с положения курсора
	{
		"i",
		"<C-H>",
		"<C-W>",
		noremap,
	},
	{
		"n",
		"<C-H>",
		"<C-W>",
		noremap,
	},

	{
		"n",
		"<C-Del>",
		"ved",
		noremap,
	},
	{
		"i",
		"<C-Del>",
		"ved",
		noremap,
	},

	-- Комбинации для TeleScope --
	-- Поиск по файлам
	-- { "n", "<C-p>", builtin.find_files, noremap },

	-- Поиск по старым файлам
	-- { "n", "<Space><Space>", builtin.oldfiles, noremap },

	-- LiveGrep
	-- FIXME: fg уже занято гитом, нужно исправить
	{
		"n",
		"<Space>fg",
		builtin.live_grep,
		noremap,
	},

	-- HelpTags (Тоже пока не знаю что это)
	{
		"n",
		"<Space>fh",
		builtin.help_tags,
		noremap,
	},

	-- Текущие буферы
	{
		"n",
		"U",
		builtin.buffers,
		noremap,
	},

	-- Комбинации клавиш для nvim-tree --
	-- Ctrl + K - показывает данные файла
	--  Сфокусироваться на сайдбаре
	{
		"n",
		"<C-y>",
		"<CMD>NvimTreeFocus<CR>",
		noremap,
	},

	--  Закрыть/Открыть сайдбар
	-- { "n", "<Space>e", "<CMD>NvimTreeToggle<CR>", noremap },

	--  Эта функция делает как будто
	--  то же самое, что и предыдущая,
	--  закрывает/открывает сайдбар
	-- { "n", "<C-n>", "<CMD>NvimTreeFindFileToggle<CR>", noremap },

	-- Комбинации клавиш для GoFmt --
	-- Применить функцию GoFmt для текущего файла
	-- TODO: тут должен быть не GoFmt, а какой то универсальный
	-- скрипт или функция которая выполнит подобное действие для
	-- любого файла
	{
		"n",
		"<Space>g",
		"<CMD>w<CR><CMD>GoFmt<CR>",
		noremap,
	},

	-- BarBar --
	-- Закрывает текущую вкладку
	-- (фактически это уже не используется, я использую Alt + x)
	-- { "n", "<C-w>", "<CMD>bd!<CR><CMD>BufferPrevious<CR>", noremap },

	-- Предыдущая вкладка (буфер)
	{
		"n",
		"<A-,>",
		"<CMD>BufferPrevious<CR>",
		noremap_silent,
	},

	-- Следующая вкладка
	{
		"n",
		"<A-.>",
		"<CMD>BufferNext<CR>",
		noremap_silent,
	},

	-- Re-order to previous/next
	-- Перемещает текущую вкладку вправо или влево
	{
		"n",
		"<A-<>",
		"<CMD>BufferMovePrevious<CR>",
		noremap_silent,
	},
	{
		"n",
		"<A->>",
		"<CMD>BufferMoveNext<CR>",
		noremap_silent,
	},

	-- Перейти в буфер по номеру
	{
		"n",
		"<A-1>",
		"<CMD>BufferGo 1<CR>",
		noremap_silent,
	},
	{
		"n",
		"<A-2>",
		"<CMD>BufferGo 2<CR>",
		noremap_silent,
	},
	{
		"n",
		"<A-3>",
		"<CMD>BufferGo 3<CR>",
		noremap_silent,
	},
	{
		"n",
		"<A-4>",
		"<CMD>BufferGo 4<CR>",
		noremap_silent,
	},
	{
		"n",
		"<A-5>",
		"<CMD>BufferGo 5<CR>",
		noremap_silent,
	},
	{
		"n",
		"<A-6>",
		"<CMD>BufferGo 6<CR>",
		noremap_silent,
	},
	{
		"n",
		"<A-7>",
		"<CMD>BufferGo 7<CR>",
		noremap_silent,
	},
	{
		"n",
		"<A-8>",
		"<CMD>BufferGo 8<CR>",
		noremap_silent,
	},
	{
		"n",
		"<A-9>",
		"<CMD>BufferGo 9<CR>",
		noremap_silent,
	},
	{
		"n",
		"<A-0>",
		"<CMD>BufferGo 0<CR>",
		noremap_silent,
	},

	-- Pin/unpin buffer
	{
		"n",
		"<A-p>",
		"<CMD>BufferPin<CR>",
		noremap_silent,
	},

	-- Close buffer
	{
		"n",
		"<A-c>",
		"<CMD>BufferClose<CR>",
		noremap_silent,
	},

	-- Wipeout buffer
	-- :BufferWipeout
	-- Close commands
	--                 :BufferCloseAllButCurrent
	--                 :BufferCloseAllButPinned
	--                 :BufferCloseAllButCurrentOrPinned
	--                 :BufferCloseBuffersLeft
	--                 :BufferCloseBuffersRight
	-- Magic buffer-picking mode
	-- TODO: нужно изменить эту мапу и обязательно использовать,
	-- похоже на нажатие `f` в vimium или qutebrowser
	-- { "n", "<C-p>", "<CMD>BufferPick<CR>", noremap_silent },

	-- Сортировка вкладок  NOTE: А нужно ли оно на самом деле?
	-- по номеру
	{
		"n",
		"<Space>bb",
		"<CMD>BufferOrderByBufferNumber<CR>",
		noremap_silent,
	},

	-- по директории
	{
		"n",
		"<Space>bd",
		"<CMD>BufferOrderByDirectory<CR>",
		noremap_silent,
	},

	-- по языку
	{
		"n",
		"<Space>bl",
		"<CMD>BufferOrderByLanguage<CR>",
		noremap_silent,
	},

	-- по номеру окна
	{
		"n",
		"<Space>bw",
		"<CMD>BufferOrderByWindowNumber<CR>",
		noremap_silent,
	},

	-- Git -- TODO: Вернись сюда после установки LazyGit, возможно
	-- это уже будет лишним
	-- git add
	{
		"n",
		"<Space>ga",
		"GitAdd<CR>",
		noremap,
	},

	-- git reset
	{
		"n",
		"<Space>gr",
		"GitReset<CR>",
		noremap,
	},

	-- Splits --
	{
		"n",
		"zv",
		":vsplit<CR>",
		noremap,
	},
	{
		"n",
		"zh",
		":split<CR>",
		noremap,
	},
	{
		"n",
		"zc",
		":only<CR>",
		noremap,
	},

	{
		"n",
		"zrh",
		":vertical resize -1<CR>",
		noremap,
	},
	{
		"n",
		"zrl",
		":vertical resize +1<CR>",
		noremap,
	},
	{
		"n",
		"zrk",
		":resize +1<CR>",
		noremap,
	},
	{
		"n",
		"zrj",
		":resize -1<CR>",
		noremap,
	},

	-- switch between splits
	-- TODO: Проверить, не заменяет ли это tmux-navigator
	{
		"n",
		"<c-k>",
		":wincmd k<CR>",
		noremap,
	},
	{
		"n",
		"<c-j>",
		":wincmd j<CR>",
		noremap,
	},
	{
		"n",
		"<c-h>",
		":wincmd h<CR>",
		noremap,
	},
	{
		"n",
		"<c-l>",
		":wincmd l<CR>",
		noremap,
	},

	-- NvTerm --
	-- TODO: Возможно стоит заменить на
	-- https://github.com/folke/snacks.nvim/blob/main/docs/terminal.md
	{
		{ "n", "t" },
		"<A-h>",
		function()
			terminal.toggle("horizontal")
		end,
		noremap_silent,
	},
	{
		{ "n", "t" },
		"<A-v>",
		function()
			terminal.toggle("vertical")
		end,
		noremap_silent,
	},
	{
		{ "n", "t" },
		"<A-i>",
		function()
			terminal.toggle("float")
		end,
		noremap_silent,
	},

	{
		"n",
		"<F5>",
		'<cmd>lua require("nvterm.terminal").send("python " .. vim.fn.expand("%"), "horizontal")<CR>',
		noremap,
	},
	-- { "n", "<F5>", run_file, noremap },

	-- Themery --
	{
		"n",
		"<Space>t",
		"<CMD>Themery<CR>",
		noremap,
	},

	-- Temp keymaps for mason lsp
	-- go to definition
	{
		"n",
		"gd",
		vim.lsp.buf.definition,
		noremap,
	},
	{
		"n",
		"fmt",
		vim.lsp.buf.format,
		noremap,
	},

	-- Keymaps for tmux navigation
	{
		{ "n", "t" },
		"<c-h>",
		"<cmd>TmuxNavigateLeft<cr>",
		noremap,
	},
	{
		{ "n", "t" },
		"<c-j>",
		"<cmd>TmuxNavigateDown<cr>",
		noremap,
	},
	{
		{ "n", "t" },
		"<c-k>",
		"<cmd>TmuxNavigateUp<cr>",
		noremap,
	},
	{
		{ "n", "t" },
		"<c-l>",
		"<cmd>TmuxNavigateRight<cr>",
		noremap,
	},
	{
		{ "n", "t" },
		"<c-\\>",
		"<cmd>TmuxNavigatePrevious<cr>",
		noremap,
	},

	-- Snacks
	-- 	Замена NvimTree
	-- 	File explorer
	{
		{ "n" },
		"<Space>e",
		function()
			snacks.explorer()
		end,
		noremap,
	},
	{
		{ "n" },
		"<C-n>",
		function()
			snacks.explorer()
		end,
		noremap,
	},

	-- 	Smart Find Files - по сути fzf, просто поиск файлов
	{
		{ "n" },
		"<Space><Space>",
		function()
			spick.smart()
		end,
		noremap,
	},
	-- 	Grep
	-- 	TODO: Это по сути тот же livegrep, то есть можно удалить предыдущий
	{
		{ "n" },
		"<Space>/",
		function()
			spick.grep()
		end,
		noremap,
	},
	-- Дубль под альтернативную команду
	{
		{ "n" },
		"<C-g>",
		function()
			spick.grep()
		end,
		noremap,
	},
	-- 	Visual selection or word - можно навести на слово и начать искать его
	{
		{ "n", "x" },
		"<Space>sw",
		function()
			spick.grep_word()
		end,
		noremap,
	},
	-- 	Buffers
	{
		{ "n" },
		"<Space>,",
		function()
			spick.buffers()
		end,
		noremap,
	},
	-- 	Command history
	{
		{ "n" },
		"<Space>:",
		function()
			spick.command_history()
		end,
		noremap,
	},
	-- 	Notification history
	{
		{ "n" },
		"<Space>n",
		function()
			spick.notifications()
		end,
		noremap,
	},

	-- 	Find files | Разница между этим и следующим по всей видимости
	-- 	в том, что этот показывает все файлы, а следующий только те
	-- 	которые есть в git
	{
		{ "n" },
		"<Space>ff",
		function()
			spick.files()
		end,
		noremap,
	},
	-- Это дубль предыдущей команды под прошлый бинд
	{
		{ "n" },
		"<C-p>",
		function()
			spick.files()
		end,
		noremap,
	},
	-- 	Find git files
	{
		{ "n" },
		"<Space>fg",
		function()
			spick.git_files()
		end,
		noremap,
	},

	-- 	Recent | Показывает последние файлы, в том числе в других
	-- 	директориях
	{
		{ "n" },
		"<Space>fr",
		function()
			spick.recent()
		end,
		noremap,
	},

	-- Дальше идут гит функции
	--	 Git Branches
	{
		{ "n" },
		"<Space>gb",
		function()
			spick.git_branches()
		end,
		noremap,
	},
	--	 Git Log
	{
		{ "n" },
		"<Space>gl",
		function()
			spick.git_log()
		end,
		noremap,
	},
	-- 	Git Log Line
	{
		{ "n" },
		"<Space>gL",
		function()
			spick.git_log_line()
		end,
		noremap,
	},
	-- 	Git Status
	{
		{ "n" },
		"<Space>gs",
		function()
			spick.git_status()
		end,
		noremap,
	},
	-- 	Git Stash - это я не знаю что такое
	{
		{ "n" },
		"<Space>gS",
		function()
			spick.git_stash()
		end,
		noremap,
	},
	-- 	Git Diff (Hunks)
	{
		{ "n" },
		"<Space>gd",
		function()
			spick.git_diff()
		end,
		noremap,
	},
	-- 	Git Log File
	{
		{ "n" },
		"<Space>gf",
		function()
			spick.git_log_file()
		end,
		noremap,
	},

	-- Buffer Lines - это я вообще не понимаю
	{
		{ "n" },
		"<Space>sb",
		function()
			spick.lines()
		end,
		noremap,
	},
	-- Grep Open Buffers
	{
		{ "n" },
		"<Space>sB",
		function()
			spick.grep_buffers()
		end,
		noremap,
	},

	-- Grep - это опять дубль
	-- { { "n" }, "<Space>sg", function() spick.grep() end, noremap },

	-- search
	-- 	Registers - показывает историю буфера обмена
	{
		{ "n" },
		'<Space>s"',
		function()
			spick.registers()
		end,
		noremap,
	},
	-- 	Search History - история поисков
	{
		{ "n" },
		"<Space>s/",
		function()
			spick.search_history()
		end,
		noremap,
	},
	-- Command History - история команд
	{
		{ "n" },
		"<Space>sc",
		function()
			spick.command_history()
		end,
		noremap,
	},
	-- Commands - показывает список всех доступных команд
	{
		{ "n" },
		"<Space>sC",
		function()
			spick.commands()
		end,
		noremap,
	},
	-- Diagnostics - вот это супер важно, можно смотреть всю диагностику по
	-- открытым буферам
	{
		{ "n" },
		"<Space>sd",
		function()
			spick.diagnostics()
		end,
		noremap,
	},
	-- Buffer Diagnostics - это возможно более важно - диагностика по одному
	-- буферу
	{
		{ "n" },
		"<Space>sD",
		function()
			spick.diagnostics_buffer()
		end,
		noremap,
	},

	-- Icons - позволяет вставить доступные иконки/эмоджи
	{
		{ "n" },
		"<Space>si",
		function()
			spick.icons()
		end,
		noremap,
	},
	-- Jumps - куда можно прыгнуть, видимо места, где я редактировал что-то
	{
		{ "n" },
		"<Space>sj",
		function()
			spick.jumps()
		end,
		noremap,
	},
	-- Keymaps - список всех мап
	{
		{ "n" },
		"<Space>sk",
		function()
			spick.keymaps()
		end,
		noremap,
	},
	-- Marks - судя по всему должен показывать закладки
	{
		{ "n" },
		"<Space>sm",
		function()
			spick.marks()
		end,
		noremap,
	},
	-- Man Pages - показывает документацию на различные программы и утилиты
	{
		{ "n" },
		"<Space>sM",
		function()
			spick.man()
		end,
		noremap,
	},

	-- Resume - OPTIM: ПРодолжи отсюда!
	{
		{ "n" },
		"<Space>sR",
		function()
			spick.resume()
		end,
		noremap,
	},
	-- Undo History
	{
		{ "n" },
		"<Space>su",
		function()
			spick.undo()
		end,
		noremap,
	},
	-- Colorschemes
	{
		{ "n" },
		"<Space>uC",
		function()
			spick.colorschemes()
		end,
		noremap,
	},
	-- LSP
	-- Goto Definition
	{
		{ "n" },
		"gd",
		function()
			spick.lsp_definitions()
		end,
		noremap,
	},
	-- Goto Declaration
	{
		{ "n" },
		"gD",
		function()
			spick.lsp_declarations()
		end,
		noremap,
	},
	-- 	References
	-- nowait = true <-- тут еще должно было быть вот это FIXME:
	{
		{ "n" },
		"gr",
		function()
			spick.lsp_references()
		end,
		noremap,
	},
	-- Goto Implementation
	{
		{ "n" },
		"gI",
		function()
			spick.lsp_implementations()
		end,
		noremap,
	},
	-- Goto T[y]pe Definition
	{
		{ "n" },
		"gy",
		function()
			spick.lsp_type_definitions()
		end,
		noremap,
	},
	-- LSP Symbols
	{
		{ "n" },
		"<Space>ss",
		function()
			spick.lsp_symbols()
		end,
		noremap,
	},
	-- LSP Workspace Symbols
	{
		{ "n" },
		"<Space>sS",
		function()
			spick.lsp_workspace_symbols()
		end,
		noremap,
	},
	-- Other
	-- Toggle Zen Mode
	{
		{ "n" },
		"<Space>z",
		function()
			snacks.zen()
		end,
		noremap,
	},
	-- Toggle Zoom
	{
		{ "n" },
		"<Space>Z",
		function()
			snacks.zen.zoom()
		end,
		noremap,
	},
	-- Toggle Scratch Buffer
	{
		{ "n" },
		"<Space>.",
		function()
			snacks.scratch()
		end,
		noremap,
	},
	-- Select Scratch Buffer
	{
		{ "n" },
		"<Space>S",
		function()
			snacks.scratch.select()
		end,
		noremap,
	},
	-- Notification History
	{
		{ "n" },
		"<Space>n",
		function()
			snacks.notifier.show_history()
		end,
		noremap,
	},
	-- Delete Buffer
	{
		{ "n" },
		"<Space>bd",
		function()
			snacks.bufdelete()
		end,
		noremap,
	},
	-- Rename File
	{
		{ "n" },
		"<Space>cR",
		function()
			snacks.rename.rename_file()
		end,
		noremap,
	},
	-- 		Git Browser
	{
		{ "n", "v" },
		"<Space>gB",
		function()
			snacks.gitbrowse()
		end,
		noremap,
	},
	-- Lazygit
	{
		{ "n" },
		"<Space>gg",
		function()
			snacks.lazygit()
		end,
		noremap,
	},
	-- Dismiss All Notifications
	{
		{ "n" },
		"<Space>un",
		function()
			snacks.notifier.hide()
		end,
		noremap,
	},
	-- Toggle Terminal
	-- TODO: Переназначь эту команду
	-- { { "n" }, "<c-/>", function() snacks.terminal() end, noremap },
	-- which_key_ignore
	-- { { "n" }, "<c-_>", function() snacks.terminal() end, noremap },

	-- 	Next Reference
	{
		{ "n" },
		"]]",
		function()
			snacks.words.jump(vim.v.count1)
		end,
		noremap,
	},
	-- 	Prev Reference
	{
		{ "n" },
		"[[",
		function()
			snacks.words.jump(-vim.v.count1)
		end,
		noremap,
	},

	-- USELESS
	-- 	Find config file ? показывает все файлы, в папках с названием config
	-- 	в целом бесполезная для меня ерунда
	{
		{ "n" },
		"<Space>fc",
		function()
			spick.files({ cwd = vim.fn.stdpath("config") })
		end,
		noremap,
	},

	-- 	Projects | Он показывает в каких git директориях мы находимся.
	-- 	Пример, у меня есть репозиторий nvim, это git проект, он находится в папке .config
	-- 	и это отдельный git проект. Вот между ними переключается эта функция.
	-- 	В целом для меня она бесполезна, но я ее здесь оставлю
	{
		{ "n" },
		"<Space>fp",
		function()
			spick.projects()
		end,
		noremap,
	},

	-- Autocmds - показывает список моих autocmd, также бесполезно
	{
		{ "n" },
		"<Space>sa",
		function()
			spick.autocmds()
		end,
		noremap,
	},

	-- Help Pages - показывает документацию, видимо по плагинам и по виму
	-- Особо не нужно, но пусть тут будет
	{
		{ "n" },
		"<Space>sh",
		function()
			spick.help()
		end,
		noremap,
	},

	-- Highlights - что то показывает, не знаю, не нужно
	{
		{ "n" },
		"<Space>sH",
		function()
			spick.highlights()
		end,
		noremap,
	},

	-- Location List - тоже не знаю, значит не нужно 
	{
		{ "n" },
		"<Space>sl",
		function()
			spick.loclist()
		end,
		noremap,
	},

	-- Search for Plugin Spec - не знаю что это
	{
		{ "n" },
		"<Space>sp",
		function()
			spick.lazy()
		end,
		noremap,
	},

	-- Quickfix List - тоже непонятно, может какие то исправления?
	{
		{ "n" },
		"<Space>sq",
		function()
			spick.qflist()
		end,
		noremap,
	},

	-- neoscroll
	-- {
	-- 	{ "n" },
	-- 	"<C-b>",
	-- 	function()
	-- 		neoscroll.ctrl_b({ duration = 350 })
	-- 	end,
	-- 	noremap,
	-- },
	--
	-- {
	-- 	{ "n" },
	-- 	"<C-f>",
	-- 	function()
	-- 		neoscroll.ctrl_f({ duration = 350 })
	-- 	end,
	-- 	noremap,
	-- },

	-- {
	-- 	{ "n" },
	-- 	"zt",
	-- 	function()
	-- 		neoscroll.zt({ duration = 350 })
	-- 	end,
	-- 	noremap,
	-- },
	--
	-- {
	-- 	{ "n" },
	-- 	"zz",
	-- 	function()
	-- 		neoscroll.zz({ duration = 350 })
	-- 	end,
	-- 	noremap,
	-- },
	--
	-- {
	-- 	{ "n" },
	-- 	"zb",
	-- 	function()
	-- 		neoscroll.zb({ duration = 350 })
	-- 	end,
	-- 	noremap,
	-- },

	-- old keymaps
	-- ['<C-u>'] = function() neoscroll.scroll({ duration = 250 }) end,
	-- ['<C-d>'] = function() neoscroll.ctrl_b({ duration = 250 }) end,
}

for _, mapping in ipairs(mappings) do
	vim.keymap.set(mapping[1], mapping[2], mapping[3], mapping[4])
end

-- добавляет использование русской клавиатуры для комбинаций клавиш
vim.cmd(
	":set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
)

vim.api.nvim_set_keymap("n", "]c", "<cmd>Gitsigns next_hunk<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[c", "<cmd>Gitsigns prev_hunk<CR>", { noremap = true, silent = true })
