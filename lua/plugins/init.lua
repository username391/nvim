local plugins = {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim"
		},
		opts = {
			ensure_installed = {
				"jsonls",
				"lua_ls",
				"cssls",
				"html",
				"pyright",
				"gopls",
				"vimls",

				-- "clangd",
				-- "intelephense",
				-- "tsserver",
				-- "emmet_ls",
				-- "omnisharp",
				-- "yamlls",
				-- "lemminx",
				-- "cmake",
				-- "powershell_es",
			}
		}
	},
	{
		"neovim/nvim-lspconfig",
		config = function ()
			-- require("plugins.lsp.handlers")

			require("lspconfig").lua_ls.setup {

				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						diagnostics = { globals = { "vim" } }
					}
				}
			}

			require("lspconfig").pyrigh.setup {
				filetypes = { "python" },
				on_attach = function (_, _)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
				end
			}
		end

	}
}

return plugins
