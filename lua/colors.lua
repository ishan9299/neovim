vim.cmd('packadd colorbuddy')
local Color, colors, Group, groups, styles = require("colorbuddy").setup()

vim.api.nvim_set_option('bg','light')

-- Base Values
Color.new('bg', "#ffffff")
Color.new('fg', "#000000")
Color.new("bg_alt", "#f0f0f0") 
Color.new("fg_alt" , "#505050")
Color.new("bg_dim" , "#f8f8f8") 
Color.new("fg_dim" , "#282828")


-- specifically for on/off states (e.g. `mode_line')
--
-- must be combined with themselves
Color.new("bg_active" , "#e0e0e0")
Color.new("fg_active" , "#191919")
Color.new("bg_inactive" , "#efedef")
Color.new("fg_inactive" , "#424242")

-- special base values, used only for cases where the above
-- fg_* or bg_* cannot or should not be used (to avoid confusion)
-- must be combined with: {fg,bg}_{main,alt,dim}
Color.new("bg_special_cold" , "#dde3f4")
Color.new("fg_special_cold" , "#093060")
Color.new("bg_special_mild" , "#c4ede0")
Color.new("fg_special_mild" , "#184034")
Color.new("bg_special_warm" , "#f0e0d4")
Color.new("fg_special_warm" , "#5d3026")
Color.new("bg_special_calm" , "#f8ddea")
Color.new("fg_special_calm" , "#61284f")

-- must be combined with: `bg_main', `bg_alt', `bg_dim'
Color.new('red',       '#a60000')
Color.new('green',     '#005e00')
Color.new('yellow',    '#813e00')
Color.new('blue',      '#00a036')
Color.new('cyan',      '#00538b')
Color.new('magenta',   '#721045')


-- styles for common, but still specialised constructs
--
-- must be combined with: `bg_main', `bg_alt', `bg_dim'
Color.new("red_alt" , "#972500")
Color.new("green_alt" , "#315b00")
Color.new("yellow_alt" , "#70480f")
Color.new("blue_alt" , "#223fbf")
Color.new("magenta_alt" , "#8f0075")
Color.new("cyan_alt" , "#30517f")
-- same purpose as above, just slight differences
--
-- must be combined with: `bg_main', `bg_alt', `bg_dim'
Color.new("red_alt_other" , "#a0132f")
Color.new("green_alt_other" , "#145c33")
Color.new("yellow_alt_other" , "#863927") 
Color.new("blue_alt_other" , "#0000bb")
Color.new("magenta_alt_other" , "#5317ac") 
Color.new("cyan_alt_other" , "#005a5f")
-- styles for desaturated foreground text, intended for use with
-- the `modus_operandi_theme_faint_syntax' option
--
-- must be combined with: `bg_main', `bg_alt', `bg_dim'
Color.new("red_faint" , "#7f1010")
Color.new("green_faint" , "#104410")
Color.new("yellow_faint" , "#5f4400") 
Color.new("blue_faint" , "#002f88")

Color.new("magenta_faint" , "#752f50") 
Color.new("cyan_faint" , "#12506f")

Color.new("red_alt_faint" , "#702f00") 
Color.new("green_alt_faint" , "#30440f")
Color.new("yellow_alt_faint" , "#5d5000") 
Color.new("blue_alt_faint" , "#003f78")
Color.new("magenta_alt_faint" , "#702565") 
Color.new("cyan_alt_faint" , "#354f6f")

Color.new("red_alt_other_faint" , "#7f002f") 
Color.new("green_alt_other_faint" , "#0f443f")
Color.new("yellow_alt_other_faint" , "#5e3a20") 
Color.new("blue_alt_other_faint" , "#1f2f6f")
Color.new("magenta_alt_other_faint" , "#5f3f7f") 
Color.new("cyan_alt_other_faint" , "#2e584f")
-- styles for elements that should be very subtle, yet accented
--
-- must be combined with: `bg_main', `bg_alt', `bg_dim' or any of
-- the "nuanced" backgrounds
Color.new("red_nuanced" , "#5f0000") 
Color.new("green_nuanced" , "#004000")
Color.new("yellow_nuanced" , "#3f3000") 
Color.new("blue_nuanced" , "#201f55")
Color.new("magenta_nuanced" , "#541f4f") 
Color.new("cyan_nuanced" , "#0f3360")
-- styles for slightly accented background
--
-- must be combined with any of the above foreground values
Color.new("red_nuanced_bg" , "#fff1f0") 
Color.new("green_nuanced_bg" , "#ecf7ed")
Color.new("yellow_nuanced_bg" , "#fff3da") 
Color.new("blue_nuanced_bg" , "#f3f3ff")
Color.new("magenta_nuanced_bg" , "#fdf0ff") 
Color.new("cyan_nuanced_bg" , "#ebf6fa")
-- styles for elements that should draw attention to themselves
--
-- must be combined with: `bg_main'
Color.new("red_intense" , "#b60000") 
Color.new("green_intense" , "#006800")
Color.new("yellow_intense" , "#904200") 
Color.new("blue_intense" , "#1111ee")
Color.new("magenta_intense" , "#7000e0") 
Color.new("cyan_intense" , "#205b93")
-- styles for background elements that should be visible yet
-- subtle
--
-- must be combined with: `fg_dim'
Color.new("red_subtle_bg" , "#f2b0a2") 
Color.new("green_subtle_bg" , "#aecf90")
Color.new("yellow_subtle_bg" , "#e4c340") 
Color.new("blue_subtle_bg" , "#b5d0ff")
Color.new("magenta_subtle_bg" , "#f0d3ff") 
Color.new("cyan_subtle_bg" , "#c0efff")
-- styles for background elements that should be visible and
-- distinguishable
--
-- must be combined with: `fg_main'
Color.new("red_intense_bg" , "#ff8892") 
Color.new("green_intense_bg" , "#5ada88")
Color.new("yellow_intense_bg" , "#f5df23") 
Color.new("blue_intense_bg" , "#6aaeff")
Color.new("magenta_intense_bg" , "#d5baff") 
Color.new("cyan_intense_bg" , "#42cbd4")
-- styles for refined contexts where both the foreground and the
-- background need to have the same/similar hue
--
-- must be combined with themselves OR the foregrounds can be
-- combined with any of the base backgrounds
Color.new("red_refine_bg" , "#ffcccc") 
Color.new("red_refine_fg" , "#780000")
Color.new("green_refine_bg" , "#aceaac") 
Color.new("green_refine_fg" , "#004c00")
Color.new("yellow_refine_bg" , "#fff29a") 
Color.new("yellow_refine_fg" , "#604000")
Color.new("blue_refine_bg" , "#8ac7ff") 
Color.new("blue_refine_fg" , "#002288")
Color.new("magenta_refine_bg" , "#ffccff") 
Color.new("magenta_refine_fg" , "#770077")
Color.new("cyan_refine_bg" , "#8eecf4") 
Color.new("cyan_refine_fg" , "#004850")
-- styles that are meant exclusively for the mode line
--
-- must be combined with: `bg_active', `bg_inactive'
Color.new("red_active" , "#930000") 
Color.new("green_active" , "#005300")
Color.new("yellow_active" , "#703700") 
Color.new("blue_active" , "#0033c0")
Color.new("magenta_active" , "#6320a0") 
Color.new("cyan_active" , "#004882")
-- styles that are meant exclusively for the fringes
--
-- must have a minimum contrast ratio of 1.5:1 with `bg_inactive'
-- and be combined with `fg_main' or `fg_dim'
Color.new("red_fringe_bg" , "#ff9a9a") 
Color.new("green_fringe_bg" , "#86cf86")
Color.new("yellow_fringe_bg" , "#e0c050") 
Color.new("blue_fringe_bg" , "#82afff")
Color.new("magenta_fringe_bg" , "#f0a3ff") 
Color.new("cyan_fringe_bg" , "#00d6e0")
-- styles reserved for specific faces


-- Colors
Color.new("bg_region" , "#bcbcbc")
Color.new("bg_paren_match" , "#70af9f")


Group.new('Normal', colors.fg, colors.bg)
Group.new('Comment', colors.fg_alt, colors.none, styles.italic)
Group.new('Error', colors.fg, colors.red_intense_bg, styles.bold)
Group.new('ErrorMsg', colors.fg, colors.red_intense_bg)
Group.new('Warning',colors.yellow_alt, colors.none)
Group.new('PreProc', colors.red_alt_other, colors.none)
Group.new('Keyworkd', colors.magenta_alt_other, colors.none)
Group.new('Visual', colors.fg, colors.magenta_intense_bg)
Group.new('String', colors.blue_alt, colors.none)
Group.new('Function', colors.magenta, colors.none)
Group.new('Type', colors.magenta_alt, colors.none)


Group.new('Search', colors.fg, colors.green_intense_bg)
-- Statusline
Group.new('StatusLine', colors.fg_alt, colors.bg_active)
Group.new('StatusLineNC', colors.bg_region, colors.bg_active)
-- Line Numbers
Group.new('LineNr', colors.fg_alt, colors.bg_dim)
Group.new('CursorLineNr', colors.fg_active, colors.bg_active, styles.bold)
-- Parenthesis
Group.new('MatchParen', colors.fg, colors.bg_paren_match)
-- Completion(Pmenu)
Group.new('Pmenu', colors.fg_active, colors.bg_active)
Group.new('PmenuSel', colors.fg_dim, colors.bg_dim)
Group.new('PmenuSbar', colors.none, colors.fg)
