fun! YourFirstPlugin()
    " dont forget to remove this one....
    lua for k in pairs(package.loaded) do if k:match("window") then package.loaded[k] = nil end end
endfun

augroup YourFirstPlugin
    autocmd!
    autocmd VimResized * :lua require("window").onResize()
augroup END

command! Buf lua require'window'.buffers()
