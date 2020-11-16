vim.cmd('packadd! lspconfig')
local lsp = require'lspconfig'
local utils = require'utils'

lsp.rust_analyzer.setup{
  on_attach = require'core.lang.lsp'.on_attach;
}

local autocmds = {
  rust_indentation = {
    {"Filetype" , "rust" , "setl ts=4 sts=4 shiftwidth=4 expandtab"},
  }
}

utils.nvim_create_augroups(autocmds)
