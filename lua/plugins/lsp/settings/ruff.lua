return {
	filetypes = { "python" },
	init_options = {
		settings = {
			-- Ruff language server settings
			logLevel = "info",
			-- args can be customized here
			args = {},
		},
	},
	settings = {
		ruff = {
			-- Enable import organization
			organizeImports = true,
			-- Enable fixAll code action
			fixAll = true,
			-- Additional configuration
			args = {
				"--select=E,W,F,I,N,UP,YTT,S,BLE,FBT,B,A,COM,C4,DTZ,T10,DJ,EM,EXE,ISC,ICN,G,INP,PIE,T20,PYI,PT,Q,RSE,RET,SLF,SLOT,SIM,TID,TCH,INT,ARG,PTH,TD,PD,PGH,PL,TRY,FLY,NPY,AIR,PERF,FURB,LOG,RUF",
				"--ignore=E501,W503,E203",  -- Ignore line length and some formatting conflicts
			},
		},
	},
	on_attach = function(client, bufnr)
		-- Disable hover in favor of Pyright
		client.server_capabilities.hoverProvider = false
		-- Organize imports on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.code_action({
					context = { only = { "source.organizeImports" } },
					apply = true,
				})
			end,
		})
	end,
}
