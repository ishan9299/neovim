local nvim_set_var = vim.api.nvim_set_var
-- Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
nvim_set_var('UltiSnipsExpandTrigger', '<tab>') -- Use <Tab> to trigger autocompletion
nvim_set_var('UltiSnipsJumpForwardTrigger', '<tab>')
nvim_set_var('UltiSnipsJumpBackwardTrigger', '<s-tab>')
