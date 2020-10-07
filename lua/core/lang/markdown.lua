local utils = require('utils')

local autocmds = {
  syntax = {
    {"BufNewFile,BufFilePre,BufRead", "*.md" , "set filetype=markdown"};
  },
  filetype = {
    {"FileType", "markdown" , "setlocal spell"};
    {"FileType", "markdown" , "setlocal complete+=kspell"};
    {"Filetype", "markdown" , "setl ts=4 sts=4 shiftwidth=4 noexpandtab"},
  }
}

utils.nvim_create_augroups(autocmds)
