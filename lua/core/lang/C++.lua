vim.cmd('packadd! lspconfig')
local utils = require('utils')

local lsp = require'nvim_lsp'
lsp.clangd.setup{
  on_attach = require'core.lang.lsp'.on_attach;
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    }
  },
}

local autocmds = {
  c_indentation = {
    {"Filetype" , "c     , cpp" , "setl ts=4 sts=4 shiftwidth=4 expandtab"},
  }
}

utils.nvim_create_augroups(autocmds)
