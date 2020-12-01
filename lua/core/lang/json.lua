local utils = require'utils'

local autocmds = {
  json_comments = {
    {"Filetype" , "json" , [[syntax match Comment +\/\/.\+$+]]}
  }
}

utils.nvim_create_augroups(autocmds)
