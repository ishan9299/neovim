local term = require('FTerm.terminal')

require'FTerm'.setup({
	dimensions  = {
		height = 0.9,
		width = 0.9,
		x = 0.5,
		y = 0.4
	},
	border = 'single' -- or 'double'
})

local gitui = term:new():setup({
	cmd = "gitui",
	dimensions = {
		height = 0.9,
		width = 0.9
	}
})

function _G.__fterm_gitui()
	gitui:toggle()
end

local musikcube = term:new():setup({
	cmd = "musikcube",
	dimensions = {
		height = 0.9,
		width = 0.9
	}
})

function _G.__fterm_musikcube()
	musikcube:toggle()
end

vim.cmd([[
nnoremap <A-t> <CMD>lua require("FTerm").toggle()<CR>
tnoremap <A-t> <C-\><C-n><CMD>lua require("FTerm").toggle()<CR>
nnoremap <leader>tg <cmd>lua __fterm_gitui()<cr>
nnoremap <leader>tm <cmd>lua __fterm_musikcube()<cr>
]])
