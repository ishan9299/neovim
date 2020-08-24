local nvim_set_var = vim.api.nvim_set_var
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
