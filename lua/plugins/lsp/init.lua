local plugins = {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
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
					"shfmt",
					-- Linters
					-- "shellcheck",

					-- "clangd",
					-- "intelephense",
					-- "emmet_ls",
					-- "omnisharp",
					-- "yamlls",
					-- "lemminx",
					-- "cmake",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
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
			})
		end,
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
