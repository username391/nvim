local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
	filetypes = { "python" }
})

lspconfig.gopls.setup({
	filetypes = { "go", "golang" }
})
