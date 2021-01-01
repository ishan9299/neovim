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

  use 'mhinz/vim-startify'
  use 'dstein64/vim-startuptime'

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
  use 'romainl/vim-qf'

  use {
     'glacambre/firenvim',
     run = function()
     vim.fn['firenvim#install'](0)
  end
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

  use 'junegunn/goyo.vim'
  use 'justinmk/vim-syntax-extra'
  use 'liuchengxu/vista.vim'
  use 'justinmk/vim-dirvish'
  use 'pechorin/any-jump.vim'
  use 'godlygeek/tabular'        -- Quickly align text by pattern
  use 'tpope/vim-surround'       -- Surround text objects easily
  use 'tpope/vim-speeddating'    -- Handle changing of dates in a nicer manner
  use 'tpope/vim-commentary'     -- Easily comment out lines or objects
  use 'tpope/vim-repeat'         -- Repeat actions better
  use 'tpope/vim-abolish'        -- Cool things with words!
  use 'tpope/vim-characterize'
  use 'AndrewRadev/splitjoin.vim'
  use 'AndrewRadev/sideways.vim' -- Easy sideways movement

  use { 'tjdevries/colorbuddy.nvim', opt = true }
  use 'tjdevries/gruvbuddy.nvim'
  use '~/Projects/modus-theme-vim'
  use 'glepnir/galaxyline.nvim'

  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      config = 'require("core.plugins.telescope")'
  }

  use 'LnL7/vim-nix'
end)

