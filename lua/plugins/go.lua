
local M = {
	"ray-x/go.nvim"
}

M.enabled = true
M.dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
}

M.config = function()
	require("go").setup()
end

M.event = { "CmdlineEnter" }
M.ft = { "go", "gomod" }
M.build = ':lua require("go.install").update_all_sync()'

return M
