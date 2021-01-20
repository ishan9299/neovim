" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif
try

lua << END
local plugins = {
  ["goyo.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/me/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
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

local packer_load = nil
local function handle_after(name, before)
  local plugin = plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    packer_load({name}, {})
  end
end

packer_load = function(names, cause)
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
-- Config for: nvim-colorizer.lua
loadstring("\27LJ\2\n«\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\bcss\1\0\b\vcss_fn\2\vhsl_fn\2\vrgb_fn\2\rRRGGBBAA\2\nnames\2\vRRGGBB\2\bRGB\2\bcss\2\1\v\0\0\thtml\15htmldjango\rmarkdown\bcss\tscss\15javascript\bphp\bvim\blua\tconf\nsetup\14colorizer\frequire\0")()
-- Config for: nvim-tree.lua
loadstring("\27LJ\2\nﬂ\5\0\0\a\0\28\0B6\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\3\1'\2\5\0=\2\4\0016\1\0\0009\1\3\1)\2(\0=\2\6\0016\1\0\0009\1\3\1)\2\0\0=\2\a\0016\1\0\0009\1\3\1)\2\1\0=\2\b\0016\1\0\0009\1\3\1)\2\1\0=\2\t\0016\1\0\0009\1\3\1)\2\1\0=\2\n\0016\1\0\0009\1\3\1)\2\1\0=\2\v\0016\1\0\0009\1\3\1)\2\1\0=\2\f\0016\1\0\0009\1\3\1)\2\1\0=\2\r\0016\1\0\0009\1\3\1'\2\15\0=\2\14\0016\1\0\0009\1\3\1)\2\1\0=\2\16\0016\1\0\0009\1\3\1)\2\1\0=\2\17\0016\1\0\0009\1\3\0015\2\19\0005\3\20\0=\3\21\0025\3\22\0=\3\23\2=\2\18\1\18\1\0\0'\3\24\0'\4\25\0'\5\26\0005\6\27\0B\1\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:NvimTreeToggle<cr>\n<C-e>\6n\vfolder\1\0\2\fdefault\bÓóø\topen\bÓóæ\bgit\1\0\5\14untracked\b‚òÖ\runstaged\b‚úó\frenamed\b‚ûú\runmerged\bÓúß\vstaged\b‚úì\1\0\2\fsymlink\bÔíÅ\fdefault\bÓòí\19lua_tree_icons\26lua_tree_allow_resize\22lua_tree_tab_open\a:~\"lua_tree_root_folder_modifier\20lua_tree_git_hl\27lua_tree_hide_dotfiles\28lua_tree_indent_markers\20lua_tree_follow\26lua_tree_quit_on_open\24lua_tree_auto_close\23lua_tree_auto_open\19lua_tree_width\tleft\18lua_tree_side\6g\20nvim_set_keymap\bapi\bvim\0")()
-- Config for: nvim-autopairs
loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0")()
-- Config for: modus-theme-vim
loadstring("\27LJ\2\nú\1\0\0\3\0\b\0\0156\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0'\2\a\0B\0\2\1K\0\1\0\18modus-vivendi\16colorscheme\15colorbuddy\frequire\23modus_faint_syntax\23modus_moody_enable\6g\bvim\0")()
-- Config for: completion-nvim
loadstring("\27LJ\2\n≠\4\0\0\6\0\23\00036\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0005\1\17\0005\2\b\0004\3\3\0005\4\6\0>\4\1\0035\4\a\0>\4\2\3=\3\t\0024\3\3\0005\4\v\0005\5\n\0=\5\f\4>\4\1\3=\3\r\0024\3\3\0005\4\14\0>\4\1\3=\3\0\0024\3\3\0005\4\15\0>\4\1\3=\3\16\2=\2\t\1=\1\5\0006\0\0\0009\0\18\0'\2\19\0B\0\2\0016\0\0\0009\0\18\0'\2\20\0B\0\2\0016\0\0\0009\0\18\0'\2\21\0B\0\2\0016\0\0\0009\0\18\0'\2\22\0B\0\2\1K\0\1\0\16augroup END;autocmd BufEnter * lua require'completion'.on_attach()\rautocmd! augroup completion_autocmds\bcmd\1\0\0\rmarkdown\1\0\1\tmode\nspell\1\0\1\tmode\bcmd\vstring\19complete_items\1\0\0\1\2\0\0\tpath\fdefault\1\0\0\1\0\1\tmode\n<c-p>\1\0\1\tmode\n<c-n>#completion_chain_complete_list\"completion_auto_change_source\1\4\0\0\nexact\14substring\nfuzzy&completion_matching_strategy_list\6g\bvim\0")()
-- Config for: nvim-lspconfig
loadstring("\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_option\bapi\bvim®\14\1\2\v\0/\0É\0013\2\0\0003\3\1\0\18\4\3\0'\6\2\0'\a\3\0B\4\3\0015\4\4\0\18\5\2\0'\a\5\0'\b\6\0'\t\a\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\b\0'\t\t\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\n\0'\t\v\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\f\0'\t\r\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\14\0'\t\15\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\16\0'\t\17\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\18\0'\t\19\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\20\0'\t\21\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\22\0'\t\23\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\24\0'\t\25\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\26\0'\t\27\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\28\0'\t\29\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\30\0'\t\31\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b \0'\t!\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\"\0'\t#\0\18\n\4\0B\5\5\0019\5$\0009\5%\5\15\0\5\0X\6\aÄ\18\5\2\0'\a\5\0'\b&\0'\t'\0\18\n\4\0B\5\5\1X\5\nÄ9\5$\0009\5(\5\15\0\5\0X\6\6Ä\18\5\2\0'\a\5\0'\b&\0'\t'\0\18\n\4\0B\5\5\0019\5$\0009\5)\5\15\0\5\0X\6\aÄ6\5*\0'\a+\0B\5\2\0029\5,\0059\5-\5'\a.\0B\5\2\0012\0\0ÄK\0\1\0≤\2                    augroup lsp_document_highlight\n                    autocmd!\n                    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()\n                    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()\n                    augroup END\n                    \27nvim_multiline_command\tutil\14lspconfig\frequire\23document_highlight\30document_range_formatting*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>f\24document_formatting\26resolved_capabilities2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\r<space>q0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\r<space>e*<cmd>lua vim.lsp.buf.references()<CR>\agr&<cmd>lua vim.lsp.buf.rename()<CR>\14<space>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\r<space>DJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\14<space>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\14<space>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\14<space>wa.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<Cmd>lua vim.lsp.buf.hover()<CR>\6K*<Cmd>lua vim.lsp.buf.definition()<CR>\agd+<Cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\1\0\2\vsilent\2\fnoremap\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0«\6\1\0\16\0/\1g6\0\0\0'\2\1\0B\0\2\0023\1\2\0005\2\3\0006\3\4\0\18\5\2\0B\3\2\4X\6\5Ä8\b\a\0009\b\5\b5\n\6\0=\1\a\nB\b\2\1E\6\3\3R\6˘+\3\0\0006\4\b\0009\4\t\0049\4\n\4'\6\v\0B\4\2\2\t\4\0\0X\4\2Ä'\3\f\0X\4\21Ä6\4\b\0009\4\t\0049\4\n\4'\6\r\0B\4\2\2\t\4\0\0X\4\2Ä'\3\14\0X\4\fÄ6\4\b\0009\4\t\0049\4\n\4'\6\15\0B\4\2\2\t\4\0\0X\4\2Ä'\3\16\0X\4\3Ä6\4\17\0'\6\18\0B\4\2\1'\4\19\0\18\5\4\0'\6\20\0\18\a\3\0'\b\21\0&\5\b\0056\6\0\0'\b\1\0B\6\2\0029\6\22\0069\6\5\0065\b\25\0005\t\23\0>\5\1\t\18\n\4\0'\v\24\0&\n\v\n>\n\3\t=\t\26\b5\t,\0005\n \0005\v\27\0006\f\b\0009\f\28\f6\14\29\0009\14\30\14'\15\31\0B\f\3\2=\f\30\v=\v!\n5\v#\0005\f\"\0=\f$\v=\v%\n5\v)\0004\f\0\b6\r\b\0009\r\t\r9\r&\r'\15'\0B\r\2\2+\14\2\0<\14\r\f6\r\b\0009\r\t\r9\r&\r'\15(\0B\r\2\2+\14\2\0<\14\r\f=\f*\v=\v+\n=\n-\t=\t.\bB\6\2\1K\0\1\0\rsettings\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\vexpand\16diagnostics\fglobals\1\0\0\1\3\0\0\bvim\buse\fruntime\1\0\0\6;\tpath\fpackage\nsplit\1\0\1\fversion\vLuaJIT\bcmd\1\0\0\14/main.lua\1\3\0\0\0\a-E\16sumneko_lua\25/lua-language-server\n/bin/.lspconfig/sumneko_lua/lua-language-server#Unsupported system for sumneko\nprint\fWindows\nwin32\nLinux\tunix\nmacOS\bmac\bhas\afn\bvim\14on_attach\1\0\0\nsetup\vipairs\1\2\0\0\16sumneko_lua\0\14lspconfig\frequire\2\0")()
-- Config for: telescope.nvim
loadstring("\27LJ\2\n˙\4\0\0\b\0\21\0/6\0\0\0009\0\1\0009\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\r\0'\6\14\0\18\a\1\0B\2\5\0016\2\15\0'\4\16\0B\2\2\0029\2\17\2'\4\18\0B\2\2\1\18\2\0\0'\4\4\0'\5\19\0'\6\20\0\18\a\1\0B\2\5\1K\0\1\0?:lua require('telescope').extensions.project.project{}<cr>\bttp\fproject\19load_extension\14telescope\frequire:<cmd>lua require('telescope.builtin').help_tags()<cr>\btht8<cmd>lua require('telescope.builtin').buffers()<cr>\btfb:<cmd>lua require('telescope.builtin').live_grep()<cr>\btlg:<cmd>lua require('telescope.builtin').git_files()<cr>\btgf;<cmd>lua require('telescope.builtin').find_files()<cr>\btff\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\0")()
-- Config for: nvim-treesitter
loadstring("\27LJ\2\nó\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2\21use_languagetree\1\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0")()
-- Config for: zig.vim
loadstring("\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\21zig_fmt_autosave\6g\bvim\0")()
-- Config for: nvim-web-devicons
loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0")()
-- Config for: undotree
loadstring("\27LJ\2\nv\0\0\a\0\a\0\n6\0\0\0009\0\1\0009\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0005\6\6\0B\1\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:UndotreeToggle<cr>\t<F5>\6n\20nvim_set_keymap\bapi\bvim\0")()
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
