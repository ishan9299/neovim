vim.cmd('packadd! lspconfig')
local lsp = require'lspconfig'

lsp.cssls.setup{
  on_attach = require'core.lang.lsp'.on_attach;
}
