return {
    "rcarriga/nvim-notify",
    module = true,
    config = function()
        require("notify").setup {
            enabled = true

        }
    end,

}
