return {
    'romgrk/barbar.nvim',
	enabled = false,

    config = function()
        require("barbar").setup {
            auto_hide = true,
            animation = true,
            separator = {left = "▎|", right = ""},
            --separator = {left = "", right = ""},
        }
    end
}

