local M = {
	-- "jose-elias-alvarez/null-ls.nvim"
	"nvimtools/none-ls.nvim",
}
M.event = { "BufReadPost", "BufNewFile" }
M.config = function()
	local null_ls = require("null-ls")

	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics

	null_ls.setup({
		debug = false,
		sources = {
			formatting.prettier.with({
				extra_filetypes = { "toml", "solidity" },
				extra_args = {
					"--no-semi",
					"--single-quote",
					"--jsx-single-quote",
					"--tab-width",
					"4",
				},
			}),
			formatting.gofmt,
			formatting.djlint,
			-- formatting.jsonls,
			-- formatting.autopep8,
			-- formatting.ruff,
			-- formatting.pyink,
			formatting.stylua,
			-- formatting.beautysh,
			formatting.shfmt,
			formatting.clang_format.with({
				filetypes = { "cpp", "c" },
			}),
			-- Linting
			-- diagnostics.shellcheck.with({
			-- 	filetypes = { "sh", "bash", "zsh" },
			-- 	only_local = "node_modules/.bin",
			-- }),
		},
	})
end

return M
