local M = {}

local function custom_attach()
  local mapper = function(mode, key, result)
    vim.fn.nvim_buf_set_keymap(0, mode, key, result, {noremap=true, silent=true})
  end

  mapper('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  mapper('n', '<leader>gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  mapper('n', '<leader>gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>')
  mapper('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  mapper('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>')
  mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')

  vim.cmd('sign define LspDiagnosticsSignError text=✖')
  vim.cmd('sign define LspDiagnosticsSignWarning text=⚠')
  vim.cmd('sign define LspDiagnosticsSignInformation text=ℹ')
  vim.cmd('sign define LspDiagnosticsSignHint text=➤')
end

function M.init()
    local lsp = require'lspconfig'

    lsp.clangd.setup{
        on_attach = custom_attach;
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

    lsp.vimls.setup{
        on_attach = custom_attach;
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
end
return M
