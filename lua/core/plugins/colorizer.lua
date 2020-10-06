vim.cmd('packadd! colorizer')
require'colorizer'.setup {
  'html',
  'htmldjango',
  'markdown',
  'css',
  'scss',
  'javascript',
  'php',
  'vim',
  'lua',

  css = {
    RGB      = true,
    RRGGBB   = true,
    names    = true,
    RRGGBBAA = true,
    rgb_fn   = true,
    hsl_fn   = true,
    css      = true,
    css_fn   = true,
  }
}
