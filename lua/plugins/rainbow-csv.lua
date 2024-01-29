local M = {
	"cameron-wags/rainbow_csv.nvim"
}

M.config = true
M.ft = {
	"csv",
	"tsv",
	"csv_semicolon",
	"csv_whitespace",
	"csv_pipe",
	"rfc_csv",
	"rfc_semicolon"
}
M.cmd = {
	"RainbowDelim",
	"RainbowDelimSimple",
	"RainbowDelimQuoted",
	"RainbowMultiDelim"
}

return M
