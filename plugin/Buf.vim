fun! YourFirstPlugin()
    " dont forget to remove this one....
    lua for k in pairs(package.loaded) do if k:match("Ibuffer") then package.loaded[k] = nil end end
endfun

command! Ibuf lua require'Ibuffer'.buffers()
