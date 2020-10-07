vim.cmd('packadd! lspconfig')

local M = {}

function M.on_attach()
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

  vim.cmd('sign define LspDiagnosticsErrorSign text=✖')
  vim.cmd('sign define LspDiagnosticsWarningSign text=⚠')
  vim.cmd('sign define LspDiagnosticsInformationSign text=ℹ')
  vim.cmd('sign define LspDiagnosticsHintSign text=➤')
end

return M
