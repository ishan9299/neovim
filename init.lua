local on_attach_vim = function()
  require'completion'.on_attach()
  require'diagnostic'.on_attach()
end
local nvim_lsp = require('nvim_lsp')

-- C/C++
nvim_lsp.clangd.setup{
	on_attach=on_attach_vim
}

-- Rust
nvim_lsp.rust_analyzer.setup{
	on_attach=on_attach_vim
}

-- Vimls
nvim_lsp.vimls.setup{
	on_attach=on_attach_vim
}
