---@diagnostic disable: unused-local
---------------------------
-- Gruvbox awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local themes_path = _THEMES_DIR

local theme = {}

-- morning
local flamingo = "#F2CDCD"
local mauve = "#DDB6F2"
local pink = "#F5C2E7"
local maroon = "#E8A2AF"
local red = "#F28FAD"
local peach = "#F8BD96"
local yellow = "#FAE3B0"
local green = "#ABE9B3"
local teal = "#B5E8E0"
local blue = "#96CDFB"
local sky = "#89DCEB"

-- night
local black0 = "#161320"
local black1 = "#1A1826"
local black2 = "#1E1E2E"
local black3 = "#302D41"
local black4 = "#575268"
local gray0 = "#6E6C7E"
local gray1 = "#988BA2"
local gray2 = "#C3BAC6"
local white = "#D9E0EE"
local lavender = "#C9CBFF"
local rosewater = "#F5E0DC"

theme.font = "FantasqueSansMono Nerd Font 10"

theme.bg_normal = black0
theme.bg_focus = black2
theme.bg_urgent = black3
theme.bg_minimize = white
theme.bg_systray = black0

theme.fg_normal = white
theme.fg_focus = mauve
theme.fg_urgent = red
theme.fg_minimize = black0

theme.useless_gap = dpi(0)
theme.border_width = dpi(2)
theme.border_normal = black2
theme.border_focus = white
theme.border_marked = red
theme.border_urgent = red

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
-- theme.tasklist_fg_focus = yellow

-- Generate taglist squares:
local taglist_square_size = dpi(5)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Variables set for theming notifications:
theme.notification_font = "JetBrainsMono Nerd Font 9"
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]
theme.notification_border_color = white
-- theme.notification_border_width = dpi(2)

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "/gruvbox/submenu.png"
theme.menu_height = dpi(30)
theme.menu_width = dpi(150)

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
