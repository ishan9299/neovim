require'FTerm'.setup({
    dimensions  = {
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5
    },
    border = 'single' -- or 'double'
})

vim.cmd([[
  nnoremap <A-t> <CMD>lua require("FTerm").toggle()<CR>
	tnoremap <A-t> <C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>
]])
