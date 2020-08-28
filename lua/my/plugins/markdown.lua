local api = vim.api

-- Markdown {{{1
-- Disable header folding
api.nvim_set_var('vim_markdown_folding_disabled', 1) 


-- do not use conceal feature, the implementation is not so good
api.nvim_set_var('vim_markdown_conceal', 0)


-- disable math tex conceal feature
api.nvim_set_var('tex_conceal', "")
api.nvim_set_var('vim_markdown_math', 1)


-- support front matter of various format
api.nvim_set_var('vim_markdown_frontmatter', 1)  -- for YAML format
api.nvim_set_var('vim_markdown_toml_frontmatter', 1) -- for TOML format
api.nvim_set_var('vim_markdown_json_frontmatter', 1) -- for JSON format
