local api = vim.api

local buf,win

local function create_win()
  start_win = api.nvim_get_current_win()

  api.nvim_command('vnew')
  win = api.nvim_get_current_win()
  buf = api.nvim_get_current_buf()

  vim.fn.nvim_win_set_width(win,25)

  vim.bo[buf].buftype = 'nofile'
  vim.bo[buf].swapfile = false
  vim.bo[buf].bufhidden = 'wipe'
  api.nvim_win_set_option(win, 'wrap', false)
  api.nvim_win_set_option(win, 'cursorline', true)
end

create_win()
