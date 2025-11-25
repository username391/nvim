-- Запуск разных autocmd
-- FIXME: Тут во всем нужно разобраться

local ignore_filetypes = { "NvimTree" }
local ignore_buftypes = { "nofile", "prompt", "popup" }

local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

vim.api.nvim_create_autocmd("WinEnter", {
	group = augroup,
	callback = function()
		local ok = vim.iter(ignore_buftypes):any(function(v)
			return v == vim.bo.buftype
		end)
		vim.w.focus_disable = ok
	end,
	desc = "Disable focus autoresize for BufType",
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	callback = function()
		local ok = vim.iter(ignore_filetypes):any(function(v)
			return v == vim.bo.filetype
		end)
		vim.w.focus_disable = ok
	end,
	desc = "Disable focus autoresize for FileType",
})

function IsFile()
	local bufname = vim.fn.bufname("%")
	return vim.fn.isdirectory(bufname) == 0
end

function OpenTreeIfNoFileIsOpened()
	if not IsFile() then
	else
		require("nvim-tree.api").tree.open()
	end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		-- OpenTreeIfNoFileIsOpened()
	end,
})

vim.api.nvim_create_autocmd("BufReadPre", {
	pattern = { "*.bat", "*.cmd", "*.lnk" },
	callback = function()
		vim.opt.fileencoding = "cp1251"
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "snacks-explorer",
	callback = function()
		vim.keymap.set("n", "<C-n>", "<Nop>", { buffer = true })
	end,
})
