vim.cmd('packadd! lspconfig')
local utils = require'utils'
local lsp = require'lspconfig'

lsp.html.setup{
  on_attach = require'core.lang.lsp'.on_attach;
}

local autocmds = {
  html_indentation = {
    {"Filetype" , "html" , "setl ts=2 sts=2 shiftwidth=2 expandtab"},
  }
}

utils.nvim_create_augroups(autocmds)
