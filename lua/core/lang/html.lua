vim.cmd('packadd! lspconfig')
local lsp = require'nvim_lsp'

lsp.html.setup{
  on_attach = require'core.lang.lsp'.on_attach;
}
