function GetShell()
	local os_name = vim.loop.os_uname().sysname
	if string.sub(os_name, 1, string.len("Windows")) == "Windows" then
		return "cmd.exe"
	else
		return "zsh"
	end
end

-- список нужных расширений
local autoformat_exts = {
	"lua",
	"py",
	"ts",
	"js",
	"json",
	"yaml",
	"yml",
	"go",
	"sh",
	"html",
}

-- функция для проверки расширения
local function should_format(ext)
	for _, e in ipairs(autoformat_exts) do
		if e == ext then
			return true
		end
	end
	return false
end

-- создать автокоманду
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		local ext = vim.fn.fnamemodify(args.file, ":e")
		if should_format(ext) then
			vim.lsp.buf.format({ async = false }) -- async=false чтобы форматить до сохранения
		end
	end,
})
