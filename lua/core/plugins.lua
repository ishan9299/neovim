local M = {}
function M.lsp()
---- This config came from https://github.com/haorenW1025/config/blob/master/.config/nvim/init.lua
  local lsp = require'nvim_lsp'

-- This is chain completion configuration
-- TODO markdown doesn't behave right
  local chain_complete_list = {
    lua = {
      string = {
        {mode = {'<c-p>'}},
        {mode = {'<c-n>'}}
      },

      func = {
        {complete_items = {'lsp'}}
      },

      default = {
        {complete_items = {'lsp'}},
        {mode = {'<c-p>'}},
        {mode = {'<c-n>'}}
      }
    },

    markdown = {
      default = {
        {mode = {'spel'}},
        {mode = {'dict'}},
        {mode = {'file'}}
      }
    },

    default = {
      {complete_items = {'lsp', 'snippet'}},
      {complete_items = {'path'}, triggered_only = {'/'}},
      {complete_items = {'buffers'}},
      {mode = {'<c-p>'}},
      {mode = {'<c-n>'}}
    },

    string = {
      {complete_items = {'path'}, triggered_only = {'/'}},
    },

  }

-- This is on_attach function which set's up mappings for buffer using daignostics, completion and LSP
  local on_attach = function()
    require'diagnostic'.on_attach({})
    require'completion'.on_attach({
      sorting = 'alphabet',
      matching_strategy_list = {'exact', 'fuzzy'},
      chain_complete_list = chain_complete_list,
    })

-- This came from https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/lsp_config.lua
    local mapper = function(mode, key, result)
      vim.fn.nvim_buf_set_keymap(0, mode, key, result, {noremap=true, silent=true})
    end

    mapper('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    mapper('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
    mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    mapper('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    mapper('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    mapper('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    mapper('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
    mapper('i', '<c-l>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  end

  vim.g.diagnostic_enable_underline = 0

  lsp.clangd.setup{
    on_attach = on_attach;
    capabilities = {
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = true
          }
        }
      }
    },
  }

  lsp.rust_analyzer.setup{
    on_attach = on_attach;
  }

  lsp.sumneko_lua.setup{
    on_attach=on_attach,
    settings = {
      Lua = {
        runtime = { version = "LuaJIT", path = vim.split(package.path, ';'), },
        completion = { keywordSnippet = "Disable", },
        diagnostics = { enable = true, globals = {
          "vim", "describe", "it", "before_each", "after_each" },
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          }
        }
      }
    }
  }

  lsp.jdtls.setup{
    on_attach = on_attach;
    filetypes = { 'java' };
    init_options = {
      workspace = '~/Documents/Programming/java'
    };
  }

  lsp.vimls.setup{
    on_attach = on_attach;
    capabilities = {
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = true
          }
        }
      }
    },
  }

  vim.cmd('sign define LspDiagnosticsErrorSign text=✖')
  vim.cmd('sign define LspDiagnosticsWarningSign text=⚠')
  vim.cmd('sign define LspDiagnosticsInformationSign text=ℹ')
  vim.cmd('sign define LspDiagnosticsHintSign text=➤')
end

function M.treesitter()
-- Treesitter
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "lua",     -- one of "all", "language", or a list of languages
    highlight = {
      enable = true,              -- false will disable the whole extension
      -- disable = { "c", "rust" },  -- list of language that will be disabled
    },
  }
end

return M
