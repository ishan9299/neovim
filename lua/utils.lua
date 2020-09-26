local vim = vim
local api = vim.api

local function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command('augroup '..group_name)
    api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      api.nvim_command(command)
    end
    api.nvim_command('augroup END')
  end
end

local function toggle_colorschemes()
  bg_color = vim.o.bg
  if bg_color == 'dark' then
    vim.cmd('colorscheme modus-operandi')
  elseif bg_color == 'light' then
    vim.cmd('colorscheme modus-vivendi')
  end
end

return {
  nvim_create_augroups = nvim_create_augroups,
  toggle_colorschemes = toggle_colorschemes
}


