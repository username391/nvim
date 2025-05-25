local M = {
	"shortcuts/no-neck-pain.nvim",
	event = "VeryLazy"
}

M.version = "*"
M.enabled = true

M.config = function()
  require("no-neck-pain").setup({
    debug = false,
    width = 70,
    minSideBufferWidth = 10,
    disableOnLastBuffer = false,
    killAllBuffersOnDisable = false,
    fallbackOnBufferDelete = true,
    autocmds = {
      enableOnVimEnter = false,
      enableOnTabEnter = false,
      reloadOnColorSchemeChange = false,
      skipEnteringNoNeckPainBuffer = false,
    },
    mappings = {
      enabled = false,
      toggle = "<Leader>np",
      toggleLeftSide = "<Leader>nql",
      toggleRightSide = "<Leader>nqr",
      widthUp = "<Leader>n=",
      widthDown = "<Leader>n-",
      scratchPad = "<Leader>ns",
    },
    callbacks = {
      preEnable = nil,
      postEnable = nil,
      preDisable = nil,
      postDisable = nil,
    },
    buffers = {
      setNames = false,
      scratchPad = {
        enabled = false,
        fileName = "no-neck-pain",
        pathToFile = "",
      },
      colors = {
        background = nil,
      },
      bo = {
        filetype = "no-neck-pain",
        buftype = "nofile",
        bufhidden = "hide",
        buflisted = false,
        swapfile = false,
      },
      wo = {
        cursorline = false,
        cursorcolumn = false,
        colorcolumn = "0",
        number = false,
        relativenumber = false,
        foldenable = false,
        list = false,
        wrap = true,
        linebreak = true,
      },
      left = { enabled = true },
      right = { enabled = true },
    },
    integrations = {
      NvimTree = { position = "left", reopen = true },
      NeoTree = { position = "left", reopen = true },
      undotree = { position = "left" },
      neotest = { position = "right", reopen = true },
      TSPlayground = { position = "right", reopen = true },
      NvimDAPUI = { position = "none", reopen = true },
      outline = { position = "right", reopen = true },
      aerial = { position = "right", reopen = true },
      dashboard = { enabled = false, filetypes = nil },
    },
  })
end

return M

