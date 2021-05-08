local true_zen = require("true-zen")

-- setup for TrueZen.nvim
true_zen.setup({
    true_false_commands = false,
	cursor_by_mode = false,
	bottom = {
		hidden_laststatus = 0,
		hidden_ruler = false,
		hidden_showmode = false,
		hidden_showcmd = false,
		hidden_cmdheight = 1,

		shown_laststatus = 2,
		shown_ruler = true,
		shown_showmode = false,
		shown_showcmd = false,
		shown_cmdheight = 1
	},
	top = {
		hidden_showtabline = 0,

		shown_showtabline = 1
	},
	left = {
		hidden_number = false,
		hidden_relativenumber = false,
		hidden_signcolumn = "no",

		shown_number = false,
		shown_relativenumber = false,
		shown_signcolumn = "no"
	},
	ataraxis = {
		ideal_writing_area_width = 0,
		just_do_it_for_me = false,
		left_padding = 10,
		right_padding = 10,
		top_padding = 0,
		bottom_padding = 0,
		custome_bg = "",
		disable_bg_configuration = false,
		disable_fillchars_configuration = false,
		force_when_plus_one_window = false,
		force_hide_statusline = true
	},
	focus = {
		margin_of_error = 5,
		focus_method = "experimental"
	},
	events = {
		before_minimalist_mode_shown = false,
		before_minimalist_mode_hidden = false,
		after_minimalist_mode_shown = false,
		after_minimalist_mode_hidden = false
	},
	integrations = {
		integration_galaxyline = true,
		integration_tmux = true,
	}
})
