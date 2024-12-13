-- lazydev.nvim is a plugin that properly configures
-- LuaLS for editing your Neovim config by
-- lazily updating your workspace libraries.

local M = {
	"folke/lazydev.nvim"
}
M.ft = "lua"
M.opts = {
	library = {
		{ path = "luvit-meta/library", words = { "vim%.uv" } },
	}
}

Mdep = {
	"Bilal2453/luvit-meta", lazy = true
}

return {M, Mdep}
