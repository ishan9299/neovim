vim.cmd('packadd! lspconfig')

local M = {}

local function on_attach()
    require'diagnostic'.on_attach()
    local mapper = function(mode, key, result)
      vim.fn.nvim_buf_set_keymap(0, mode, key, result, {noremap=true, silent=true})
    end

    mapper('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    mapper('n', '<leader>gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    mapper('n', '<leader>gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>')
    mapper('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')

    mapper('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>')

    mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')

    -- Stop all language servers
    vim.cmd 'command! LspStop lua vim.lsp.stop_client(vim.lsp.get_active_clients())'
    -- CodeAction
    vim.cmd 'command! CodeAction lua vim.lsp.buf.code_action()'
end

function M.init()
  local lsp = require'nvim_lsp'
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

  lsp.html.setup{}

  lsp.cssls.setup{}

  -- lsp.cmake.setup{}

  vim.cmd('sign define LspDiagnosticsErrorSign text=✖')
  vim.cmd('sign define LspDiagnosticsWarningSign text=⚠')
  vim.cmd('sign define LspDiagnosticsInformationSign text=ℹ')
  vim.cmd('sign define LspDiagnosticsHintSign text=➤')
end

return M
