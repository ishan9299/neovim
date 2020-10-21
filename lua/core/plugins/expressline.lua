local vim = vim
vim.cmd('packadd! plenary')
vim.cmd('packadd! expressline')


local generator = function()
  local el_segments = {}

  -- Option 2, just a function that returns a string.
  local extensions = require('el.extensions')
  table.insert(el_segments, extensions.mode) -- mode returns the current mode.

  -- expresss_line provides a helpful wrapper for these.
  -- You can check out el.builtin
  local builtin = require('el.builtin')
  table.insert(el_segments, ' ')
  table.insert(el_segments, builtin.tail)
  table.insert(el_segments, ' ')
  table.insert(el_segments, builtin.modified)
  table.insert(el_segments, '%=')
  table.insert(el_segments, builtin.filetype)
  table.insert(el_segments, ' ')

  -- Option 4, you can return a coroutine.
  --  In lua, you can cooperatively multi-thread.
  --  You can use `coroutine.yield()` to yield execution to another coroutine.
  --
  -- For example, in luvjob.nvim, there is `co_wait` which is a coroutine version of waiting for a job to complete. So you can start multiple jobs at once and wait for them to all be done.
  table.insert(el_segments, extensions.git_changes)

  return el_segments
end

-- And then when you're all done, just call
require('el').setup { generator = generator }
