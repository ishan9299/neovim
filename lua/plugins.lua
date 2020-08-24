-- vim: foldmethod=marker

local nvim_buf_set_keymap = vim.api.nvim_buf_set_keymap
local nvim_buf_set_option = vim.api.nvim_buf_set_option
local nvim_set_var = vim.api.nvim_set_var

-- LSP {{{1
vim.cmd('packadd nvim-lsp')
local nvim_lsp = require('nvim_lsp')

local on_attach = function(_, bufnr)
	nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	require'diagnostic'.on_attach()
	require'completion'.on_attach()

	-- Mappings.
	local opts = { noremap=true, silent=true }
	nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
end

local servers = { 'clangd', 'rust_analyzer', 'sumneko_lua', 'vimls' }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
	}
end

-- Ultisnips{{{1
-- Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
nvim_set_var('UltiSnipsExpandTrigger', '<tab>') -- Use <Tab> to trigger autocompletion
nvim_set_var('UltiSnipsJumpForwardTrigger', '<tab>')
nvim_set_var('UltiSnipsJumpBackwardTrigger', '<s-tab>')


-- Markdown {{{1
-- Disable header folding
nvim_set_var('vim_markdown_folding_disabled', 1) 


-- do not use conceal feature, the implementation is not so good
nvim_set_var('vim_markdown_conceal', 0)


-- disable math tex conceal feature
nvim_set_var('tex_conceal', "")
nvim_set_var('vim_markdown_math', 1)


-- support front matter of various format
nvim_set_var('vim_markdown_frontmatter', 1)  -- for YAML format
nvim_set_var('vim_markdown_toml_frontmatter', 1) -- for TOML format
nvim_set_var('vim_markdown_json_frontmatter', 1) -- for JSON format
