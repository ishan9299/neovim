require('core.mappings').setup() -- set the default keys
require('core.autocmds')         -- This sets up the autocommands for terminal git files

-- Only required if you have packer in your `opt` pack
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
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- For narrowing regions of text to look at them alone
  use 'chrisbra/NrrwRgn' -- Figure out some good ways to use this on stream

  use 'tweekmonster/spellrotate.vim'
  -- }}}
  -- VIM EDITOR: {{{

  -- Little know features:
  --   :SSave
  --   :SLoad
  --       These are wrappers for mksession that work great. I never have to use
  --       mksession anymore or worry about where things are saved / loaded from.
  use 'mhinz/vim-startify'

  -- Better profiling output for startup.
  use 'dstein64/vim-startuptime'
  -- use 'tweekmonster/startuptime.vim'  -- Might switch back to this, but they are incompatible.

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
  use 'norcalli/nvim-terminal.lua'

  -- Make comments appear IN YO FACE
  use 'tjdevries/vim-inyoface'

  -- :Messages <- view messages in quickfix list
  -- :Verbose  <- view verbose output in preview window.
  -- :Time     <- measure how long it takes to run some stuff.
  use 'tpope/vim-scriptease'

  -- Quickfix enhancements. See :help vim-qf
  use 'romainl/vim-qf'

  use {
     'glacambre/firenvim',
     run = function()
     vim.fn['firenvim#install'](0)
  end
  }

  -- Pretty icons. Not necessarily required.

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

  --   FOCUSING: {{{
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'
  --   }}}
  -- }}}

  --  LANGUAGE: {{{
  -- TODO: Should check on these if they are the best ones
  use 'justinmk/vim-syntax-extra'
  use 'elzr/vim-json'

  -- Lua {{{
  use 'euclidianAce/BetterLua.vim'
  -- }}}

  -- Typescript {{{
  -- TODO: Should probably only load these when necessary.
  -- TODO: Should prboably check if these work for typescript, typescript.tsx, etc.
  use 'jelera/vim-javascript-syntax'
  use 'othree/javascript-libraries-syntax.vim'
  use 'leafgarland/typescript-vim'
  use 'peitalin/vim-jsx-typescript'

  -- use { 'prettier/vim-prettier', run = 'yarn install' }

  use 'mattn/emmet-vim'
  use { 'vim-scripts/JavaScript-Indent', ft = 'javascript' }
  use { 'pangloss/vim-javascript', ft = { 'javascript', 'html' } }
  use 'tpope/vim-liquid'
  -- }}}
  --  }}}
  -- LSP {{{

  -- Configurations for neovim lsp.
  --   neovim/neovim has all of the LSP code.
  use {
  'neovim/nvim-lspconfig',
  config = 'require("core.plugins.lspconfig")',
  }

  -- STREAM: Figure out how to use snippets better
  use {
  'haorenW1025/completion-nvim',
  config = 'require("core.plugins.completion")',
  }

  -- TODO: I think this may be causing large buffers to slow considerably.
  --       I also think I can just use ^X^N if I need to?...
  -- use 'steelsojka/completion-buffers'

  use 'norcalli/snippets.nvim'

  -- Cool tags based viewer
  --   :Vista  <-- Opens up a really cool sidebar with info about file.
  use 'liuchengxu/vista.vim'

  -- }}}
  -- TREE SITTER: {{{
  use {
  'nvim-treesitter/nvim-treesitter',
  config = require'nvim-treesitter.configs'.setup {
     ensure_installed = { "javascript", "typescript", "lua", "cpp", "nix", "go" },     -- one of "all", "language", or a list of languages
     highlight = {
        enable = false,              -- false will disable the whole extension
        use_languagetree = false,
     },
  },
  }
  use 'nvim-treesitter/playground'

  -- }}}
  -- NAVIGATION: {{{
  -- STREAM: Show off edit_alternate.vim

  use 'google/vim-searchindex'

  use 'justinmk/vim-dirvish'
  use 'pechorin/any-jump.vim'

  -- Temporary disabled... getting real bad performance in some lua files.
  --  Might just disable for Lua only?...
  -- use 'andymass/vim-matchup'

  -- }}}
  -- TEXT MANIUPLATION {{{
  use 'godlygeek/tabular'        -- Quickly align text by pattern
  use 'tpope/vim-surround'       -- Surround text objects easily
  use 'tpope/vim-speeddating'    -- Handle changing of dates in a nicer manner
  use 'tpope/vim-commentary'     -- Easily comment out lines or objects
  use 'tpope/vim-repeat'         -- Repeat actions better
  use 'tpope/vim-abolish'        -- Cool things with words!
  use 'tpope/vim-characterize'
  use 'AndrewRadev/splitjoin.vim'
  use 'AndrewRadev/sideways.vim' -- Easy sideways movement

  -- GIT: {{{
  -- gita replacement
  use 'lambdalisue/gina.vim'

  -- Sweet message committer
  use 'rhysd/committia.vim'

  -- Floating windows are awesome :)
  use 'rhysd/git-messenger.vim'

  -- }}}

  use 'untitled-ai/jupyter_ascending.vim'

  use 'tjdevries/standard.vim'
  use 'tjdevries/conf.vim'
  use 'junegunn/vader.vim'

  use 'lervag/wiki.vim'
  use 'ihsanturk/neuron.vim'

  use 'ThePrimeagen/vim-apm'
  use 'ThePrimeagen/vim-be-good'


  use 'tjdevries/colorbuddy.nvim'
  use 'tjdevries/gruvbuddy.nvim'
  use 'ishan9299/modus-theme-vim'
  use 'glepnir/galaxyline.nvim'

  -- NIX
  use 'LnL7/vim-nix'
end)

