require('core.mappings').setup()
require('core.autocmds')

local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
   -- TODO: Maybe handle windows better?
   if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
      return
   end

   local directory = string.format(
   '%s/site/pack/packer/opt/',
   vim.fn.stdpath('data')
   )

   vim.fn.mkdir(directory, 'p')

   local out = vim.fn.system(string.format(
   'git clone %s %s',
   'https://github.com/wbthomason/packer.nvim',
   directory .. '/packer.nvim'
   ))

   print(out)
   print("Downloading packer.nvim...")

   return
end


return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  -- Pretty colors
  use {
     'norcalli/nvim-colorizer.lua',
     config = function()
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
        'conf',
        css = {
           RGB      = true,
           RRGGBB   = true,
           names    = true,
           RRGGBBAA = true,
           rgb_fn   = true,
           hsl_fn   = true,
           css      = true,
           css_fn   = true,
        },
     }
     end,
  }

  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
    require'nvim-web-devicons'.setup {
      default = true;
    }
    end,
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = 'require"core.plugins.luatree"',
  }

  use {
      'nvim-treesitter/nvim-treesitter',
      config = require'nvim-treesitter.configs'.setup {
          ensure_installed = "maintained",
          highlight = {
              enable = true,
              use_languagetree = false,
          },
      },
  }

  use 'junegunn/goyo.vim'
  use 'justinmk/vim-syntax-extra'
  use 'justinmk/vim-dirvish'
  use 'godlygeek/tabular'
  use 'tpope/vim-surround'
  use 'tpope/vim-speeddating'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-abolish'
  use 'tpope/vim-characterize'
  use 'LnL7/vim-nix'
  use 'mhinz/vim-startify'
  use 'dstein64/vim-startuptime'
  use 'tjdevries/colorbuddy.nvim'
  use 'tjdevries/gruvbuddy.nvim'
  use '~/.config/nvim/modus-theme-vim'
  use 'glepnir/galaxyline.nvim'
end)

