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
    'kyazdani42/nvim-tree.lua',
    config = 'require"core.plugins.luatree"',
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
      'nvim-lua/completion-nvim',
      config = function()
          vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
          vim.g.completion_auto_change_source = 1

          vim.g.completion_chain_complete_list = {
              default = {
                  default = {
                      {mode = '<c-n>'},
                      {mode = '<c-p>'},
                  },
                  ['string'] = {
                      {complete_items = {'path'}},
                  },
                  vim = {
                      {mode = 'cmd'},
                  },
                  markdown = {
                      {mode = 'spell'},
                  },
              }
          }

          vim.cmd[[autocmd BufEnter * lua require'completion'.on_attach()]]
      end
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

  use {
      'mbbill/undotree',
      config = function()
          vim.api.nvim_set_keymap('n', '<F5>', ':UndotreeToggle<cr>', { silent = true, noremap = true })
      end
  }

  use {
      'windwp/nvim-autopairs',
      config = function()
          require('nvim-autopairs').setup()
      end
  }

  use {
      'ziglang/zig.vim',
      config = function()
          vim.g.zig_fmt_autosave = 1
      end
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
  use 'benbusby/vim-earthbound-themes' -- moonside theme
  use '~/.config/nvim/modus-theme-vim'
  use 'glepnir/galaxyline.nvim'
end)

