vim.cmd('packadd! nvim-ts-rainbow')
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    disable = {'lua', 'bash'} -- please disable lua and bash for now
  }
}
