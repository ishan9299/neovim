local vim = vim
vim.cmd('packadd! plenary')
vim.cmd('packadd! expressline')


local generator = function()
  local el_segments = {}

  local builtin = require('el.builtin')
  local extensions = require('el.extensions')
  local subscribe = require('el.subscribe')

  table.insert(el_segments, extensions.mode)
   table.insert(el_segments,
    subscribe.buf_autocmd(
      "el_file_icon",
      "BufRead",
      function(_, buffer)
        return extensions.file_icon(_, buffer)
      end
    ))
    table.insert(el_segments, builtin.shortened_file)

   table.insert(el_segments,
    subscribe.buf_autocmd(
      "el_git_branch",
      "BufEnter",
      function(window, buffer)
        return extensions.git_branch(window, buffer)
      end
    ))

    return el_segments
end

-- And then when you're all done, just call
require('el').setup { generator = generator }
