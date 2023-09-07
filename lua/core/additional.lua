local notify = require("notify")
local nvim_tree_api = require('nvim-tree.api')


local function getCurrentNode()
	local node = nvim_tree_api.tree.get_node_under_cursor()
	return node
end


function RunCommandOnCurrentFile(command)
	-- notify не будет работать так, как нужно
	-- если neovim запущен в cmd или powershell
	local node = getCurrentNode()
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
