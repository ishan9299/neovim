local switcher = {}

switcher['modus-vivendi'] = {
	modus_termtrans = 1,
	modus_faint_syntax = 1,
}

switcher['modus-operandi'] = {
	modus_termtrans = 1,
	modus_faint_syntax = 1,
}

for name,settings in pairs(switcher) do
	for setting,value in pairs(settings) do
		vim.g[setting] = value
	end
	vim.cmd(string.format('colorscheme %s', name))
end
