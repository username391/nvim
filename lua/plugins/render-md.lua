return {
	-- Make sure to set this up properly if you have lazy=true
	"MeanderingProgrammer/render-markdown.nvim",
	lazy = true,
	enabled = true,

	opts = {
		file_types = { "markdown", "Avante" },
	},
	ft = { "markdown", "Avante" },
}
