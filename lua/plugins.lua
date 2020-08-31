local packer = nil
local function init()
  if packer == nil then
    packer = require('packer')
    packer.init()
  end

  local use = packer.use
  packer.reset()

  -- Packer
  use {'wbthomason/packer.nvim', opt = true}

  -- Tpope plugins
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'

  -- snippet
  use {'SirVer/ultisnips', opt = true}
  use {'hanzo/vim-snippets'}

  -- Search
  use {'junegunn/fzf'}
  use {'junegunn/fzf.vim', opt = true}

  -- Completion and linting
  use {'neovim/nvim-lsp', opt = true}
  use {
    'nvim-lua/completion-nvim',
    opt = true,
    requires = {{'nvim-lua/diagnostic-nvim', opt = true}}
  }

  -- Highlight colors
  use {'norcalli/nvim-colorizer.lua', opt = true}

  -- movement
  use {'justinmk/vim-sneak'}

  use {'junegunn/goyo.vim', opt = true}

  -- statusline
  use {'tjdevries/luvjob.nvim', opt = true}
  use {'tjdevries/expressline.nvim', opt = true}
  use {'tjdevries/colorbuddy.vim', opt = true}

  -- Language multipack
  use 'sheerun/vim-polyglot'

  -- Better Lua highlighting
  use 'euclidianAce/BetterLua.vim'

  -- Path navigation
  use 'justinmk/vim-dirvish'
  use 'kristijanhusak/vim-dirvish-git'

  -- wiki
  use {'vim-pandoc/vim-pandoc-syntax'}
  use {'fcpg/vim-waikiki'}
  use {'plasticboy/vim-markdow'}
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end
})

return plugins
