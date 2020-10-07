vim.cmd('packadd! lspconfig')
local lsp = require'nvim_lsp'
local utils = require'utils'

lsp.vimls.setup{
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
    {"Filetype" , "vim" , "setl ts=2 sts=2 shiftwidth=2 expandtab"},
  }
}

utils.nvim_create_augroups(autocmds)
