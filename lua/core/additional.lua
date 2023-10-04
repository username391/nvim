local notify = require("notify")
local nvim_tree_api = require('nvim-tree.api')


local function getCurrentNode()
	if nvim_tree_api.tree.is_tree_buf() then
		local node = nvim_tree_api.tree.get_node_under_cursor()
		return node
	else
		local absolute_path = vim.fn.expand("%:p")
		local filename = vim.fn.expand("%:t")

		return { name = filename, absolute_path = absolute_path}
	end
end


function RunCommandOnCurrentFile(command)
	local node = getCurrentNode()
	-- notify не будет работать так, как нужно
	-- если neovim запущен в cmd или powershell
	local handle = io.popen(command .. " " .. node.absolute_path)
	local result = ""

	if handle then
		result = handle:read("*a")
		handle:close()
	else
		result = "ERROR: handle == nil"
	end

	notify(result, "info", { title = command .. " " .. node.name})
end


function GitAdd()
	RunCommandOnCurrentFile("git add")
end

function GitReset()
	RunCommandOnCurrentFile("git reset")
end

-- Это кстати не работает
function AfterSave()
	if vim.bo.filetype == "python" then
		-- vim.cmd(":silent !ruff --fix %")
		local result = vim.api.nvim_exec("!ruff --fix %", true)
		notify(result)
	end
end


function GetShell()
	local os_name = vim.loop.os_uname().sysname
	if string.sub(os_name, 1, string.len("Windows")) == "Windows" then
		return "cmd.exe"
	else
		return "bash"
	end
end
