function _G.toggleLineNumbers()
    local relativeNumbers = (vim.wo.rnu and vim.wo.nu)
    local numbers = vim.wo.nu
    if (numbers == false) then
        vim.wo.nu = true -- move to normal lineNumbers
    elseif (numbers == true and relativeNumbers == false) then
        vim.wo.rnu = true -- move to relativeNumbers
    elseif (relativeNumbers == true) then
        vim.wo.nu = false -- hide the numbering
        vim.wo.rnu = false -- hide the relative numbering
    end
end
