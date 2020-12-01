vim.cmd('packadd! lspconfig')
local lsp = require'lspconfig'

lsp.tsserver.setup{}
