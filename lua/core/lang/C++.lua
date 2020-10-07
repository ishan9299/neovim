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
  filetypes = {
    {"Filetype" , "c     , cpp" , "setl ts=8 sts=8 shiftwidth=8 noexpandtab"},
  }
}

utils.nvim_create_augroups(autocmds)
