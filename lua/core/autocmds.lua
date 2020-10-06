local utils = require('utils')


local autocmds = {
  highlight_yank = {
    {"TextYankPost", "*", [[silent! lua require'vim.highlight'.on_yank("Substitute", 200)]]};
  };

  markdown_syntax = {
    {"BufNewFile,BufFilePre,BufRead", "*.md"     , "set filetype=markdown"};
    {"FileType", "markdown" , "setlocal spell"};
    {"FileType", "markdown" , "setlocal complete+=kspell"};
  };

  git = {
    {"Filetype", "gitcommit" , "setlocal spell"};
    {"Filetype", "gitcommit" , "setlocal complete+=kspell"};
  };

  nix_syntax = {
    {"BufNewFile,BufFilePre,BufRead", "*.nix", "set filetype=nix | setlocal tabstop=2"};
  };

  terminal = {
    {"TermOpen", "*", "setlocal norelativenumber nonumber"};
    {"TermOpen", "*", "startinsert"};
  };

  filetypes = {
    {"Filetype" , "c     , cpp" , "setl ts=8 sts=8 shiftwidth=8 noexpandtab"},
    {"Filetype" , "rust       " , "setl ts=8 sts=8 shiftwidth=8 noexpandtab"},
    {"Filetype" , "lua        " , "setl ts=2 sts=2 shiftwidth=2 expandtab"},
    {"Filetype" , "vim        " , "setl ts=2 sts=2 shiftwidth=2 expandtab"},
    {"Filetype" , "nix        " , "setl ts=2 sts=2 shiftwidth=2 expandtab"},
    {"Filetype" , "markdown   " , "setl ts=4 sts=4 shiftwidth=4 noexpandtab"},
    {"Filetype" , "java       " , "setl ts=8 sts=8 shiftwidth=4 noexpandtab"},
  };
}

utils.nvim_create_augroups(autocmds)

