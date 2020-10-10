vim.cmd('packadd! lspconfig')
vim.cmd('packadd! nlua')

local lsp = require'nvim_lsp'
local utils = require'utils'

lsp.sumneko_lua.setup{
  on_attach = require'core.lang.lsp'.on_attach;
  settings = {
    Lua = {
      runtime = { version = "LuaJIT", path = vim.split(package.path, ';'), },
      completion = { keywordSnippet = "Disable", },
      diagnostics = { enable = true, globals = {
        "vim", "describe", "it", "before_each", "after_each" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        }
      }
    }
  }
}

local autocmds = {
  lua_indentation = {
    {"Filetype" , "lua" , "setl ts=2 sts=2 shiftwidth=2 expandtab"},
  }
}

utils.nvim_create_augroups(autocmds)
