local plugins = {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"jsonls",
				"lua_ls",
				"cssls",
				"html",
				"pyright",
				"gopls",
				"vimls",
				"bash-language-server",

				-- "clangd",
				-- "intelephense",
				-- "tsserver",
				-- "emmet_ls",
				-- "omnisharp",
				-- "yamlls",
				-- "lemminx",
				-- "cmake",
				"powershell_es",
			}
		}
	},
	{
		"neovim/nvim-lspconfig",
		config = function ()
			require("plugins.lsp.handlers")

			require("lspconfig").lua_ls.setup {
				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						diagnostics = { globals = { "vim" } }
					}
				}
			}
		end

	}
}

return plugins
