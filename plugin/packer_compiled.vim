" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif
try

lua << END
  local package_path_str = "/home/me/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/me/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/me/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/me/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
  local install_cpath_pattern = "/home/me/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
  if not string.find(package.path, package_path_str, 1, true) then
    package.path = package.path .. ';' .. package_path_str
  end

  if not string.find(package.cpath, install_cpath_pattern, 1, true) then
    package.cpath = package.cpath .. ';' .. install_cpath_pattern
  end

_G.packer_plugins = {
  ["colorbuddy.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["goyo.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  kommentary = {
    config = { "\27LJ\2\nc\0\0\3\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\1\4\0005\2\5\0>\2\2\1=\1\3\0K\0\1\0\1\3\0\0\b/* \b */\1\2\0\0\a# \bnix\vconfig\22kommentary.config\frequire\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["modus-theme-vim"] = {
    config = { "\27LJ\2\ny\0\0\3\0\a\0\v6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0'\2\6\0B\0\2\1K\0\1\0\18modus-vivendi\16colorscheme\15colorbuddy\frequire\23modus_moody_enable\6g\bvim\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/modus-theme-vim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n«\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\bcss\1\0\b\nnames\2\vRRGGBB\2\bRGB\2\bcss\2\vcss_fn\2\vhsl_fn\2\vrgb_fn\2\rRRGGBBAA\2\1\v\0\0\thtml\15htmldjango\rmarkdown\bcss\tscss\15javascript\bphp\bvim\blua\tconf\nsetup\14colorizer\frequire\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\nä\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\a\ttags\2\nspell\2\nvsnip\1\rnvim_lua\2\vbuffer\2\rnvim_lsp\1\tpath\2\1\0\t\14preselect\venable\25allow_prefix_unmatch\1\21incomplete_delay\3ê\3\19source_timeout\3»\1\18throttle_time\3P\ndebug\1\15min_length\3\1\17autocomplete\2\fenabled\2\nsetup\ncompe\frequire\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nﬂ\5\0\0\a\0\28\0B6\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\3\1'\2\5\0=\2\4\0016\1\0\0009\1\3\1)\2(\0=\2\6\0016\1\0\0009\1\3\1)\2\0\0=\2\a\0016\1\0\0009\1\3\1)\2\1\0=\2\b\0016\1\0\0009\1\3\1)\2\1\0=\2\t\0016\1\0\0009\1\3\1)\2\1\0=\2\n\0016\1\0\0009\1\3\1)\2\1\0=\2\v\0016\1\0\0009\1\3\1)\2\1\0=\2\f\0016\1\0\0009\1\3\1)\2\1\0=\2\r\0016\1\0\0009\1\3\1'\2\15\0=\2\14\0016\1\0\0009\1\3\1)\2\1\0=\2\16\0016\1\0\0009\1\3\1)\2\1\0=\2\17\0016\1\0\0009\1\3\0015\2\19\0005\3\20\0=\3\21\0025\3\22\0=\3\23\2=\2\18\1\18\1\0\0'\3\24\0'\4\25\0'\5\26\0005\6\27\0B\1\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:NvimTreeToggle<cr>\n<C-e>\6n\vfolder\1\0\2\fdefault\bÓóø\topen\bÓóæ\bgit\1\0\5\14untracked\b‚òÖ\runmerged\bÓúß\vstaged\b‚úì\runstaged\b‚úó\frenamed\b‚ûú\1\0\2\fsymlink\bÔíÅ\fdefault\bÓòí\19lua_tree_icons\26lua_tree_allow_resize\22lua_tree_tab_open\a:~\"lua_tree_root_folder_modifier\20lua_tree_git_hl\27lua_tree_hide_dotfiles\28lua_tree_indent_markers\20lua_tree_follow\26lua_tree_quit_on_open\24lua_tree_auto_close\23lua_tree_auto_open\19lua_tree_width\tleft\18lua_tree_side\6g\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nó\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2\21use_languagetree\1\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  tabular = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n˙\4\0\0\b\0\21\0/6\0\0\0009\0\1\0009\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\r\0'\6\14\0\18\a\1\0B\2\5\0016\2\15\0'\4\16\0B\2\2\0029\2\17\2'\4\18\0B\2\2\1\18\2\0\0'\4\4\0'\5\19\0'\6\20\0\18\a\1\0B\2\5\1K\0\1\0?:lua require('telescope').extensions.project.project{}<cr>\bttp\fproject\19load_extension\14telescope\frequire:<cmd>lua require('telescope.builtin').help_tags()<cr>\btht8<cmd>lua require('telescope.builtin').buffers()<cr>\btfb:<cmd>lua require('telescope.builtin').live_grep()<cr>\btlg:<cmd>lua require('telescope.builtin').git_files()<cr>\btgf;<cmd>lua require('telescope.builtin').find_files()<cr>\btff\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    config = { "\27LJ\2\nv\0\0\a\0\a\0\n6\0\0\0009\0\1\0009\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0005\6\6\0B\1\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:UndotreeToggle<cr>\t<F5>\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-abolish"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-characterize"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-characterize"
  },
  ["vim-dirvish"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-dirvish"
  },
  ["vim-earthbound-themes"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-earthbound-themes"
  },
  ["vim-nix"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-nix"
  },
  ["vim-repeat"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-speeddating"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-speeddating"
  },
  ["vim-startify"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-startuptime"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["zig.vim"] = {
    config = { "\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\21zig_fmt_autosave\6g\bvim\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/start/zig.vim"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = packer_plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

local packer_load = nil
local function handle_after(name, before)
  local plugin = packer_plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    packer_load({name}, {})
  end
end

packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not packer_plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if packer_plugins[name].commands then
      for _, cmd in ipairs(packer_plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if packer_plugins[name].keys then
      for _, key in ipairs(packer_plugins[name].keys) do
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
    if not packer_plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if packer_plugins[name].config then
        for _i, config_line in ipairs(packer_plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if packer_plugins[name].after then
        for _, after_name in ipairs(packer_plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      packer_plugins[name].loaded = true
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

    local escaped_keys = vim.api.nvim_replace_termcodes(cause.keys .. extra, true, true, true)
    vim.api.nvim_feedkeys(escaped_keys, 'm', true)
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

_packer_load_wrapper = function(names, cause)
  success, err_msg = pcall(packer_load, names, cause)
  if not success then
    vim.cmd('echohl ErrorMsg')
    vim.cmd('echomsg "Error in packer_compiled: ' .. vim.fn.escape(err_msg, '"') .. '"')
    vim.cmd('echomsg "Please check your config for correctness"')
    vim.cmd('echohl None')
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Post-load configuration
-- Config for: undotree
loadstring("\27LJ\2\nv\0\0\a\0\a\0\n6\0\0\0009\0\1\0009\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0005\6\6\0B\1\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:UndotreeToggle<cr>\t<F5>\6n\20nvim_set_keymap\bapi\bvim\0")()
-- Config for: telescope.nvim
loadstring("\27LJ\2\n˙\4\0\0\b\0\21\0/6\0\0\0009\0\1\0009\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\r\0'\6\14\0\18\a\1\0B\2\5\0016\2\15\0'\4\16\0B\2\2\0029\2\17\2'\4\18\0B\2\2\1\18\2\0\0'\4\4\0'\5\19\0'\6\20\0\18\a\1\0B\2\5\1K\0\1\0?:lua require('telescope').extensions.project.project{}<cr>\bttp\fproject\19load_extension\14telescope\frequire:<cmd>lua require('telescope.builtin').help_tags()<cr>\btht8<cmd>lua require('telescope.builtin').buffers()<cr>\btfb:<cmd>lua require('telescope.builtin').live_grep()<cr>\btlg:<cmd>lua require('telescope.builtin').git_files()<cr>\btgf;<cmd>lua require('telescope.builtin').find_files()<cr>\btff\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\0")()
-- Config for: zig.vim
loadstring("\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\21zig_fmt_autosave\6g\bvim\0")()
-- Config for: nvim-compe
loadstring("\27LJ\2\nä\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\a\ttags\2\nspell\2\nvsnip\1\rnvim_lua\2\vbuffer\2\rnvim_lsp\1\tpath\2\1\0\t\14preselect\venable\25allow_prefix_unmatch\1\21incomplete_delay\3ê\3\19source_timeout\3»\1\18throttle_time\3P\ndebug\1\15min_length\3\1\17autocomplete\2\fenabled\2\nsetup\ncompe\frequire\0")()
-- Config for: nvim-colorizer.lua
loadstring("\27LJ\2\n«\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\bcss\1\0\b\nnames\2\vRRGGBB\2\bRGB\2\bcss\2\vcss_fn\2\vhsl_fn\2\vrgb_fn\2\rRRGGBBAA\2\1\v\0\0\thtml\15htmldjango\rmarkdown\bcss\tscss\15javascript\bphp\bvim\blua\tconf\nsetup\14colorizer\frequire\0")()
-- Config for: kommentary
loadstring("\27LJ\2\nc\0\0\3\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\1\4\0005\2\5\0>\2\2\1=\1\3\0K\0\1\0\1\3\0\0\b/* \b */\1\2\0\0\a# \bnix\vconfig\22kommentary.config\frequire\0")()
-- Config for: nvim-web-devicons
loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0")()
-- Config for: nvim-autopairs
loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0")()
-- Config for: nvim-tree.lua
loadstring("\27LJ\2\nﬂ\5\0\0\a\0\28\0B6\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\3\1'\2\5\0=\2\4\0016\1\0\0009\1\3\1)\2(\0=\2\6\0016\1\0\0009\1\3\1)\2\0\0=\2\a\0016\1\0\0009\1\3\1)\2\1\0=\2\b\0016\1\0\0009\1\3\1)\2\1\0=\2\t\0016\1\0\0009\1\3\1)\2\1\0=\2\n\0016\1\0\0009\1\3\1)\2\1\0=\2\v\0016\1\0\0009\1\3\1)\2\1\0=\2\f\0016\1\0\0009\1\3\1)\2\1\0=\2\r\0016\1\0\0009\1\3\1'\2\15\0=\2\14\0016\1\0\0009\1\3\1)\2\1\0=\2\16\0016\1\0\0009\1\3\1)\2\1\0=\2\17\0016\1\0\0009\1\3\0015\2\19\0005\3\20\0=\3\21\0025\3\22\0=\3\23\2=\2\18\1\18\1\0\0'\3\24\0'\4\25\0'\5\26\0005\6\27\0B\1\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:NvimTreeToggle<cr>\n<C-e>\6n\vfolder\1\0\2\fdefault\bÓóø\topen\bÓóæ\bgit\1\0\5\14untracked\b‚òÖ\runmerged\bÓúß\vstaged\b‚úì\runstaged\b‚úó\frenamed\b‚ûú\1\0\2\fsymlink\bÔíÅ\fdefault\bÓòí\19lua_tree_icons\26lua_tree_allow_resize\22lua_tree_tab_open\a:~\"lua_tree_root_folder_modifier\20lua_tree_git_hl\27lua_tree_hide_dotfiles\28lua_tree_indent_markers\20lua_tree_follow\26lua_tree_quit_on_open\24lua_tree_auto_close\23lua_tree_auto_open\19lua_tree_width\tleft\18lua_tree_side\6g\20nvim_set_keymap\bapi\bvim\0")()
-- Config for: modus-theme-vim
loadstring("\27LJ\2\ny\0\0\3\0\a\0\v6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0'\2\6\0B\0\2\1K\0\1\0\18modus-vivendi\16colorscheme\15colorbuddy\frequire\23modus_moody_enable\6g\bvim\0")()
-- Config for: nvim-treesitter
loadstring("\27LJ\2\nó\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2\21use_languagetree\1\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0")()
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
  call luaeval('_packer_load_wrapper(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  au FileType markdown ++once call s:load(['goyo.vim'], { "ft": "markdown" })
  " Event lazy-loads
  " Function lazy-loads
augroup END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
