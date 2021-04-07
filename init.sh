#!/bin/sh

installAll()
{
	git submodule add --name modus-theme-vim https://github.com/ishan9299/modus-theme-vim pack/packages/opt/modus-theme-vim
	git submodule add --name nvim-solarized-lua https://github.com/ishan9299/nvim-solarized-lua pack/packages/opt/nvim-solarized-lua
	git submodule add --name nvim-toggleterm https://github.com/akinsho/nvim-toggleterm.lua pack/packages/opt/nvim-toggleterm
	git submodule add --name nvim-lspconfig https://github.com/neovim/nvim-lspconfig pack/packages/opt/lspconfig
	git submodule add --name tabular https://github.com/godlygeek/tabular pack/packages/opt/tabular
	git submodule add --name vim-commentary https://github.com/tpope/vim-commentary pack/packages/opt/vim-commentary
	git submodule add --name vim-dirvish https://github.com/justinmk/vim-dirvish pack/packages/opt/vim-dirvish
	git submodule add --name vim-nix https://github.com/LnL7/vim-nix pack/packages/opt/vim-nix
	git submodule add --name vim-repeat https://github.com/tpope/vim-repeat pack/packages/opt/vim-repeat
	git submodule add --name vim-surround https://github.com/tpope/vim-surround pack/packages/opt/vim-surround
	git submodule add --name vim-startuptime https://github.com/dstein64/vim-startuptime pack/packages/opt/vim-startuptime
	git submodule add --name vim-glsl https://github.com/tikhomirov/vim-glsl pack/packages/opt/vim-glsl
	git submodule add --name nvim-compe https://github.com/hrsh7th/nvim-compe pack/packages/opt/nvim-compe
}

updateAll()
{
	git submodule update --remote --merge
}

fetchAll()
{
}
