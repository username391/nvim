local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
	lua_ls = {
		settings = {
			Lua = {
				workspace = { checkThirdParty = false },
				diagnostics = { globals = { "vim" } },
			},
		},
	},
	pyright = require("plugins.lsp.settings.pyright"),
	ruff = require("plugins.lsp.settings.ruff"),
	gopls = require("plugins.lsp.settings.gopls"),
	bashls = require("plugins.lsp.settings.bashls"),
	ts_ls = require("plugins.lsp.settings.ts_ls"),
}

for name, config in pairs(servers) do
	config.capabilities = capabilities
	lspconfig[name].setup(config)
end
