---------------------------
-- Gruvbox awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local themes_path = _THEMES_DIR

local theme = {}

-- Background colors
local bg = "#282828"
local bg1 = "#3c3836"
local bg_red = "#cc241d"
local bg_green = "#98971a"
local bg_yellow = "#d79921"
local bg_blue = "#458588"
local bg_purple = "#b16286"
local bg_aqua = "#689d6a"
local bg_gray = "#a89984"
local bg_orange = "#d65d0e"

-- Foreground colors
local fg = "#ebdbb2"
local fg_red = "#fb4934"
local fg_green = "#b8bb26"
local fg_yellow = "#fabd2f"
local fg_blue = "#83a598"
local fg_purple = "#d3869b"
local fg_aqua = "#8ec07c"
local fg_gray = "#928374"
local fg_orange = "#fe8019"

theme.font = "FantasqueSansMono Nerd Font 10"

theme.bg_normal = bg
theme.bg_focus = bg1
theme.bg_urgent = bg1
theme.bg_minimize = bg_aqua
theme.bg_systray = bg

theme.fg_normal = fg
theme.fg_focus = fg_yellow
theme.fg_urgent = fg_red
theme.fg_minimize = fg

theme.useless_gap = dpi(0)
theme.border_width = dpi(1)
theme.border_normal = bg
theme.border_focus = fg
theme.border_marked = bg_red

-- There are other variable sets
-- overriding the /gruvbox one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "/gruvbox/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path .. "/gruvbox/titlebar/close_normal.png"
theme.titlebar_close_button_focus = themes_path .. "/gruvbox/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path .. "/gruvbox/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path .. "/gruvbox/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path .. "/gruvbox/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "/gruvbox/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "/gruvbox/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = themes_path .. "/gruvbox/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path .. "/gruvbox/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "/gruvbox/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "/gruvbox/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = themes_path .. "/gruvbox/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path .. "/gruvbox/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "/gruvbox/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path .. "/gruvbox/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = themes_path .. "/gruvbox/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "/gruvbox/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "/gruvbox/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "/gruvbox/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themes_path .. "/gruvbox/titlebar/maximized_focus_active.png"

theme.wallpaper = _CONF_DIR .. "/wallpapers/wall"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. "/gruvbox/layouts/fairh.png"
theme.layout_fairv = themes_path .. "/gruvbox/layouts/fairv.png"
theme.layout_floating = themes_path .. "/gruvbox/layouts/floating.png"
theme.layout_magnifier = themes_path .. "/gruvbox/layouts/magnifier.png"
theme.layout_max = themes_path .. "/gruvbox/layouts/max.png"
theme.layout_fullscreen = themes_path .. "/gruvbox/layouts/fullscreen.png"
theme.layout_tilebottom = themes_path .. "/gruvbox/layouts/tilebottom.png"
theme.layout_tileleft = themes_path .. "/gruvbox/layouts/tileleft.png"
theme.layout_tile = themes_path .. "/gruvbox/layouts/tile.png"
theme.layout_tiletop = themes_path .. "/gruvbox/layouts/tiletop.png"
theme.layout_spiral = themes_path .. "/gruvbox/layouts/spiral.png"
theme.layout_dwindle = themes_path .. "/gruvbox/layouts/dwindle.png"
theme.layout_cornernw = themes_path .. "/gruvbox/layouts/cornernw.png"
theme.layout_cornerne = themes_path .. "/gruvbox/layouts/cornerne.png"
theme.layout_cornersw = themes_path .. "/gruvbox/layouts/cornersw.png"
theme.layout_cornerse = themes_path .. "/gruvbox/layouts/cornerse.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
