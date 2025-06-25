local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
	pyright = require("plugins.lsp.settings.pyright"),
	ruff = require("plugins.lsp.settings.ruff"),
	gopls = require("plugins.lsp.settings.gopls"),
	bashls = require("plugins.lsp.settings.bashls"),
	ts_ls = require("plugins.lsp.settings.ts_ls")
}

for name, config in pairs(servers) do
  config.capabilities = capabilities
  lspconfig[name].setup(config)
end

-- lspconfig.pyright.setup({
-- 	filetypes = { "python" }
-- })
--
-- lspconfig.gopls.setup({
-- 	filetypes = { "go", "golang" }
-- })
--
-- lspconfig.bashls.setup({
--   filetypes = { "sh", "bash" },
-- })
