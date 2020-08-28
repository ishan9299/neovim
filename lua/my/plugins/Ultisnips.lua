local api = vim.api
-- Ultisnips{{{1
-- Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
api.nvim_set_var('UltiSnipsExpandTrigger', '<tab>') -- Use <Tab> to trigger autocompletion
api.nvim_set_var('UltiSnipsJumpForwardTrigger', '<tab>')
api.nvim_set_var('UltiSnipsJumpBackwardTrigger', '<s-tab>')


