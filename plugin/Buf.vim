fun! YourFirstPlugin()
    " dont forget to remove this one....
    lua for k in pairs(package.loaded) do if k:match("window") then package.loaded[k] = nil end end
endfun

command! Buf lua require'window'.buffers()
