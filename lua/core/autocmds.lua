local ignore_filetypes = { 'NvimTree' }
local ignore_buftypes = { 'nofile', 'prompt', 'popup' }

local augroup =
    vim.api.nvim_create_augroup('FocusDisable', { clear = true })

vim.api.nvim_create_autocmd('WinEnter', {
    group = augroup,
    callback = function(_)
        if vim.tbl_contains(ignore_buftypes, vim.bo.buftype)
        then
            vim.w.focus_disable = true
        else
            vim.w.focus_disable = false
        end
    end,
    desc = 'Disable focus autoresize for BufType',
})

vim.api.nvim_create_autocmd('FileType', {
    group = augroup,
    callback = function(_)
        if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
            vim.w.focus_disable = true
        else
            vim.w.focus_disable = false
        end
    end,
    desc = 'Disable focus autoresize for FileType',
})

function IsFile()
	local bufname = vim.fn.bufname("%")
	return vim.fn.isdirectory(bufname) == 0
end

function OpenTreeIfNoFileIsOpened()
	if not IsFile() then
	else
		require("nvim-tree.api").tree.open()
	end
end


vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = function()
	-- OpenTreeIfNoFileIsOpened()
end
})
