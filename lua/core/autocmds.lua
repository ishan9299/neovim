local utils = require('utils')

local autocmds = {
  highlight_yank = {
    {"TextYankPost", "*", [[silent! lua require'vim.highlight'.on_yank("Substitute", 200)]]};
  };

  git = {
    {"Filetype", "gitcommit" , "setlocal spell"};
    {"Filetype", "gitcommit" , "setlocal complete+=kspell"};
  };

  terminal = {
    {"TermOpen", "*", "setlocal norelativenumber nonumber"};
    {"TermOpen", "*", "startinsert"};
  };

}

utils.nvim_create_augroups(autocmds)
