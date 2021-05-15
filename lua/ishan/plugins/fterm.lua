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

vim.cmd('command! Gitui lua __fterm_gitui()')

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

vim.cmd('command! Musikcube lua __fterm_musikcube()')

vim.cmd([[
nnoremap <f5> <cmd>lua require("FTerm").toggle()<cr>
tnoremap <f5> <c-\><c-n><cmd>lua require("FTerm").toggle()<cr>
]])
