local vim = vim
local api = vim.api

local buf,win,startWin

local function switch()
  local buffer = api.nvim_get_current_line()
  api.nvim_set_current_win(startWin)
  api.nvim_command('b ' .. buffer)
end

local function close()
  if win and api.nvim_win_is_valid(win) then
    api.nvim_win_close(win,true)
  end
end

local function switch_and_close()
  switch()
  close()
end

local function set_mappings()
  local mappings = {
    q = 'close()',
    ['<cr>'] = 'switch_and_close()',
    -- v = 'split("v")',
    -- s = 'split("")',
    -- p = 'preview()',
    -- t = 'open_in_tab()'
  }

  local opts = {noremap = true , silent = true}

  for k,v in pairs(mappings) do
    vim.api.nvim_buf_set_keymap(buf, 'n', k, ':lua require"window".'..v..'<cr>', opts)
  end
end

local function createWindow()
  local stats = api.nvim_list_uis()[1]
  local width = stats.width
  local height = stats.height
  startWin = api.nvim_get_current_win()

  buf = api.nvim_create_buf(false,false)
  vim.bo[buf].buftype = 'nofile'
  vim.bo[buf].swapfile = false
  vim.bo[buf].bufhidden = 'wipe'
  vim.bo[buf].filetype = 'bufswitcher'

  local options = {
    relative = 'editor',
    height = height-4,
    width = width-4,
    row = 2,
    col = 2
  }
  win = api.nvim_open_win(buf, true, options)
  vim.wo[win].number = false
  vim.wo[win].cursorline = true
  vim.wo[win].wrap = false
  vim.wo[win].relativenumber = false
  set_mappings()
end

local function list()
  vim.bo[buf].modifiable = true

  local function isempty(s)
    return s == nil or s == ''
  end

  local names = {}
  local bufferList = api.nvim_list_bufs()

  for _,number in pairs(bufferList) do
    if api.nvim_buf_is_loaded(number) then
      local buffername = vim.fn.bufname(number)
      if not isempty(buffername) then
        table.insert(names,buffername)
      end
    end
  end

  api.nvim_buf_set_lines(buf , 0 , -1 , false , names)
  vim.bo[buf].modifiable = false
end

local function buffers()
  if win and vim.api.nvim_win_is_valid(win) then
    api.nvim_set_current_win(win)
  else
    createWindow()
  end
  list()
end

-- TODO write an function to switch buffers

return {
  createWindow = createWindow,
  close = close,
  switch_and_close = switch_and_close,
  switch = switch,
  buffers = buffers
}
