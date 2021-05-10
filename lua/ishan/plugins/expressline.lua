-- copied from https://github.com/tjdevries/config_manager/blob/1b8ab10ddc06217cd532376e52d74678c3a0e805/xdg_config/nvim/lua/plugin/statusline.lua#L7
require('el').reset_windows()

local builtin = require('el.builtin')
local extensions = require('el.extensions')
local sections = require('el.sections')
local subscribe = require('el.subscribe')
local lsp_statusline = require('el.plugins.lsp_status')
local helper = require('el.helper')

local has_lsp_extensions, ws_diagnostics = pcall(require, 'lsp_extensions.workspace.diagnostic')

-- TODO: Spinning planet extension. Integrated w/ telescope.
-- ◐ ◓ ◑ ◒
-- 🌛︎🌝︎🌜︎🌚︎
-- Show telescope icon / emoji when you open it as well

local git_icon = subscribe.buf_autocmd("el_file_icon", "BufRead", function(_, bufnr)
	local icon = extensions.file_icon(_, bufnr)
	if icon then
		return icon .. ' '
	end

	return ''
end)

local git_branch = subscribe.buf_autocmd(
"el_git_branch",
"BufEnter",
function(window, buffer)
	local branch = extensions.git_branch(window, buffer)
	if branch then
		return ' ' .. extensions.git_icon() .. ' ' .. branch
	end
end
)

local git_changes = subscribe.buf_autocmd(
"el_git_changes",
"BufWritePost",
function(window, buffer)
	return extensions.git_changes(window, buffer)
end
)

local ws_diagnostic_counts = function(_, buffer)
	if not has_lsp_extensions then
		return ''
	end

	local messages = {}

	local error_count = ws_diagnostics.get_count(buffer.bufnr, "Error")

	local x = "⬤"
	if error_count == 0 then
		-- pass
	elseif error_count < 5 then
		table.insert(messages, string.format('%s#%s#%s%%*', '%', "StatuslineError" .. error_count, x))
	else
		table.insert(messages, string.format('%s#%s#%s%%*', '%', "StatuslineError5", x))
	end

	return table.concat(messages, "")
end

local show_current_func = function(window, buffer)
	if buffer.filetype == 'lua' then
		return ''
	end

	return lsp_statusline.current_function(window, buffer)
end

require('el').setup {
	generator = function(_, _)
		return {
			extensions.gen_mode {
				format_string = ' %s '
			},
			git_branch,
			' ',
			sections.split,
			git_icon,
			sections.maximum_width(
			builtin.responsive_file(140, 90),
			0.30
			),
			sections.collapse_builtin {
				' ',
				builtin.modified_flag
			},
			sections.split,
			show_current_func,
			lsp_statusline.server_progress,
			ws_diagnostic_counts,
			git_changes,
			'[', builtin.line_with_width(3), ':',  builtin.column_with_width(2), ']',
			sections.collapse_builtin {
				'[',
				builtin.help_list,
				builtin.readonly_list,
				']',
			},
			builtin.filetype,
		}
	end
}
