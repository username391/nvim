local M = {
	"jose-elias-alvarez/null-ls.nvim"
}
M.event = { "BufReadPost", "BufNewFile" }
M.config = function()
	local null_ls = require "null-ls"

	local formatting = null_ls.builtins.formatting
	-- local diagnostics = null_ls.builtins.diagnostics

	null_ls.setup {
		debug = false,
		sources = {
			formatting.prettier.with {
				extra_filetypes = { "toml", "solidity" },
				extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
			},
			formatting.gofumpt,
			formatting.autopep8,
			formatting.stylua,
			formatting.clang_format.with {
				filetypes = { "cpp", "c" },
			},
		},
	}
end

return M

