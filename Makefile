# Need to figure out stuf for gitsubmodules
install:
	git submodule update --init --recursive
	echo "Install sumneko_lua!\n"
	mkdir -p lspconfig/sumneko_lua
	cd lspconfig/sumneko_lua
	git clone https://github.com/sumneko/lua-language-server
	cd lua-language-server
	git submodule update --init --recursive
	cd 3rd/luamake
	ninja -f ninja/linux.ninja
	cd ../..
	./3rd/luamake/luamake rebuild
