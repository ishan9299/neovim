vim.cmd('packadd! lspconfig')
local lsp = require'nvim_lsp'
local utils = require'utils'

  lsp.jdtls.setup{
    on_attach = on_attach;
    filetypes = { 'java' };
    init_options = {
      workspace = '~/Documents/Programming/java'
    };
  }


local autocmds = {
  java_indentation = {
    {"Filetype" , "java" , "setl ts=8 sts=8 shiftwidth=4 expandtab"},
  }
}
utils.nvim_create_augroups(autocmds)
