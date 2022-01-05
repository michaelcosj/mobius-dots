-- If LuaRocks is installed, make sure that packages installed through it are
-- found, else do nothing.
pcall(require, "luarocks.loader")

-- standard libraries
local awful = require("awful")
local beautiful = require("beautiful")
require("awful.autofocus")

-- error handling
require("config.errors")

Awesome_cfg_dir = "~/.config/awesome"
Themes_dir = Awesome_cfg_dir .. "/themes/"
Scripts_dir = "~/.scripts"

-- default apps
Apps = {
	terminal = "kitty",
	editor = os.getenv("EDITOR") or "nvim",
	browser = "firefox",
	filemanager = "dbus-launch pcmanfm",
	screenshot_utility = "flameshot gui",
}

-- popular keys
Keys = {
	modkey = "Mod4",
	alt = "Mod1",
	shift = "Shift",
	ctrl = "Control",
}

-- my tags
Tags = { " オ ", " タ ", " ク ", " で ", " は ", " な ", " い " }

local themes = {
	gruvbox = Themes_dir .. "gruvbox/theme.lua",
	multicolor = Themes_dir .. "multicolor/theme.lua",
	nord = Themes_dir .. "nord/theme.lua",
	powerarrow = Themes_dir .. "powerarrow/theme.lua",
	powerarrow_dark = Themes_dir .. "powerarrow-dark/theme.lua",
	rainbow = Themes_dir .. "rainbow/theme.lua",
	steamburn = Themes_dir .. "steamburn/theme.lua",
	vertex = Themes_dir .. "vertex/theme.lua",
}

local Layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.floating,
	awful.layout.suit.fair,
	awful.layout.suit.max,
	awful.layout.suit.max.fullscreen,
	awful.layout.suit.magnifier,
	--  awful.layout.suit.corner.nw,
}

-- init theme
beautiful.init(themes.gruvbox)

-- run autostart script
awful.spawn.with_shell(Scripts_dir .. "/autostart.sh")

-- set layouts
awful.layout.layouts = Layouts

-- set bindings
local bindings = require("bindings")
root.buttons(bindings.globalbuttons)
root.keys(bindings.globalkeys)

-- set window rules
awful.rules.rules = require("config.rules")

-- menu
-- require("config.menu")

-- topbar
require("decoration.topbar")

-- signals
require("config.signals")

-- Garbage collection for lower memory consumption
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
