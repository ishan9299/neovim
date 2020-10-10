local utils = require'utils'

local autocmds = {
  nix_syntax = {
    {"BufNewFile,BufFilePre,BufRead", "*.nix", "set filetype=nix | setlocal tabstop=2"};
  },
  nix_indentation = {
    {"Filetype" , "nix" , "setl ts=2 sts=2 shiftwidth=2 expandtab"},
  }
}

utils.nvim_create_augroups(autocmds)
