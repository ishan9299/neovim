vim.cmd([[
  nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
  nnoremap <leader>lg <cmd>lua require('telescope.builtin').live_grep()<cr>
  nnoremap <leader>bb <cmd>lua require('telescope.builtin').buffers()<cr>
  nnoremap <leader>hh <cmd>lua require('telescope.builtin').help_tags()<cr>
]])
