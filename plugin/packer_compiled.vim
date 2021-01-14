" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

lua << END
local plugins = {
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

_packer_load = nil

local function handle_after(name, before)
  local plugin = plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    _packer_load({name}, {})
  end
end

_packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if plugins[name].commands then
      for _, cmd in ipairs(plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if plugins[name].keys then
      for _, key in ipairs(plugins[name].keys) do
        del_maps[key] = true
      end
    end
  end

  for cmd, _ in pairs(del_cmds) do
    vim.cmd('silent! delcommand ' .. cmd)
  end

  for key, _ in pairs(del_maps) do
    vim.cmd(fmt('silent! %sunmap %s', key[1], key[2]))
  end

  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if plugins[name].config then
        for _i, config_line in ipairs(plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if plugins[name].after then
        for _, after_name in ipairs(plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      plugins[name].loaded = true
    end
  end

  handle_bufread(names)

  if cause.cmd then
    local lines = cause.l1 == cause.l2 and '' or (cause.l1 .. ',' .. cause.l2)
    vim.cmd(fmt('%s%s%s %s', lines, cause.cmd, cause.bang, cause.args))
  elseif cause.keys then
    local keys = cause.keys
    local extra = ''
    while true do
      local c = vim.fn.getchar(0)
      if c == 0 then break end
      extra = extra .. vim.fn.nr2char(c)
    end

    if cause.prefix then
      local prefix = vim.v.count ~= 0 and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    -- NOTE: I'm not sure if the below substitution is correct; it might correspond to the literal
    -- characters \<Plug> rather than the special <Plug> key.
    vim.fn.feedkeys(string.gsub(string.gsub(cause.keys, '^<Plug>', '\\<Plug>') .. extra, '<[cC][rR]>', '\r'))
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Post-load configuration
-- Config for: completion-nvim
loadstring("\27LJ\2\n“\3\0\0\6\0\19\0'6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\1\0005\1\16\0005\2\t\0004\3\3\0005\4\a\0>\4\1\0035\4\b\0>\4\2\3=\3\n\0024\3\3\0005\4\f\0005\5\v\0=\5\r\4>\4\1\3=\3\14\0024\3\3\0005\4\15\0>\4\1\3=\3\0\2=\2\n\1=\1\6\0006\0\0\0009\0\17\0'\2\18\0B\0\2\1K\0\1\0;autocmd BufEnter * lua require'completion'.on_attach()\bcmd\1\0\0\1\0\1\tmode\bcmd\vstring\19complete_items\1\0\0\1\2\0\0\tpath\fdefault\1\0\0\1\0\1\tmode\n<c-p>\1\0\1\tmode\n<c-n>#completion_chain_complete_list\"completion_auto_change_source!completion_enable_auto_paren\1\4\0\0\nexact\14substring\nfuzzy&completion_matching_strategy_list\6g\bvim\0")()
-- Config for: zig.vim
loadstring("\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\21zig_fmt_autosave\6g\bvim\0")()
-- Config for: nvim-colorizer.lua
loadstring("\27LJ\2\n«\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\bcss\1\0\b\bRGB\2\bcss\2\vcss_fn\2\vhsl_fn\2\vrgb_fn\2\rRRGGBBAA\2\nnames\2\vRRGGBB\2\1\v\0\0\thtml\15htmldjango\rmarkdown\bcss\tscss\15javascript\bphp\bvim\blua\tconf\nsetup\14colorizer\frequire\0")()
-- Config for: nvim-tree.lua
require"core.plugins.luatree"
-- Config for: nvim-autopairs
loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0")()
-- Config for: nvim-web-devicons
loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0")()
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
call luaeval('_packer_load(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  " Event lazy-loads
augroup END
