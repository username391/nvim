local plugins = {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		opts = {
			ensure_installed = {
				-- LSP servers
				"lua_ls",
				"pyright",
				"ruff",
				"gopls",
				"bashls",
				"ts_ls",
				"jsonls",
				"cssls",
				"html",
				"vimls",
				"powershell_es",
				-- Formatters
				"stylua",
				"shfmt",
				"prettier",
				"djlint",
				-- Linters
				"shellcheck",

				-- "clangd",
				-- "intelephense",
				-- "emmet_ls",
				-- "omnisharp",
				-- "yamlls",
				-- "lemminx",
				-- "cmake",
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"pyright",
				"ruff",
				"gopls",
				"bashls",
				"ts_ls",
				"jsonls",
				"cssls",
				"html",
			},
			automatic_installation = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Load all LSP configurations from handlers
			require("plugins.lsp.handlers")
		end,
	},
}

return plugins
