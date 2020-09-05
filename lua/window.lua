local vim = vim
local api = vim.api

local buf,winId

local function open()
  local buf_num = string.byte[2]
  api.nvim_command('b ' .. buf_num)
end

local function close()
end

local function open_close()
  open()
  close()
end

local function createWindow()
  local stats = api.nvim_list_uis()[1]
  local width = stats.width
  local height = stats.height

  buf = api.nvim_create_buf(false,false)
  vim.bo[buf].buftype = 'nofile'
  vim.bo[buf].swapfile = false
  vim.bo[buf].bufhidden = 'wipe'

  local options = {
    relative = 'editor',
    height = height-4,
    width = width-4,
    row = 2,
    col = 2
  }
  winId = api.nvim_open_win(buf, true, options)
  vim.wo[winId].number = false
  vim.wo[winId].cursorline = true
  vim.wo[winId].wrap = false
  vim.wo[winId].relativenumber = false
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
        print("Insert buffer " , buffername)
        buffername = '[' .. number .. '] ' .. buffername
        table.insert(names,buffername)
      end
    end
  end

  api.nvim_buf_set_lines(buf , 0 , -1 , false , names)
  vim.bo[buf].modifiable = false
end

local function switch()
  local buffer = vim.api.nvim_get_current_line()
  print(buffer)
end

local function set_mappings()
  local mappings = {
    q = 'close()',
    ['<cr>'] = 'open_and_close()',
    -- v = 'split("v")',
    -- s = 'split("")',
    -- p = 'preview()',
    -- t = 'open_in_tab()'
  }

  for k,v in pairs(mappings) do
    local opts = {nowait = true, noremap = true , silent = true}
    vim.api.nvim_buf_set_keymap(buf, 'n', k, ':lua require"nvim-oldfile".'..v..'<cr>', opts)
  end
end

local function buffers()
  if winId and vim.api.nvim_win_is_valid(winId) then
    api.nvim_set_current_win(winId)
  else
    createWindow()
  end
  list()
end

buffers()

-- TODO write an function to switch buffers


return {
  createWindow = createWindow,
  list = list,
  open = open,
  close = close,
  open_close = open_close,
  switch = switch,
  set_mappings = set_mappings,
  buffers = buffers
}
