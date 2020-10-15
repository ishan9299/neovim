vim.cmd('packadd! completion')

vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.completion_enable_auto_paren = 1
vim.g.completion_confirm_key = ''

vim.g.completion_chain_complete_list = {
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

local autocmds = {
    completion_nvim = {
        -- Use completion-nvim in every buffer
        {'BufEnter', '*', "lua require'completion'.on_attach()"},
    }
}

local normal_silent = { silent = true, noremap = false }
vim.api.nvim_set_keymap('i', '<tab>', [[<Plug>(completion_smart_tab)]], normal_silent)
vim.api.nvim_set_keymap('i', '<s-tab>', [[<Plug>(completion_smart_s_tab)]], normal_silent)

require'utils'.nvim_create_augroups(autocmds)
