-- If LuaRocks is installed, make sure that packages installed through it are
-- found, else do nothing.
pcall(require, "luarocks.loader")

-- standard libraries
local awful = require("awful")
local beautiful = require("beautiful")
require("awful.autofocus")

-- error handling
require("config.errors")

_CONF_DIR = "/home/michael/.config/awesome"
_THEMES_DIR = _CONF_DIR .. "/themes"
_SCRIPTS_DIR = "/home/michael/dotfiles/scripts/"

-- run autostart script
awful.spawn.with_shell(_SCRIPTS_DIR .. "autostart.sh")

-- default apps
APPS = {
	terminal = "kitty",
	editor = os.getenv("EDITOR") or "nvim",
	browser = os.getenv("BROWSER") or "firefox",
	filemanager = "dbus-launch pcmanfm",
	screenshot_utility = "flameshot gui",
}

-- popular keys
KEYS = {
	modkey = "Mod4",
	alt = "Mod1",
	shift = "Shift",
	ctrl = "Control",
}

-- my tags
TAGS = { " オ ", " タ ", " ク ", " で ", " は ", " な ", " い " }

local Layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.floating,
	awful.layout.suit.fair,
	awful.layout.suit.max,
	awful.layout.suit.max.fullscreen,
	awful.layout.suit.magnifier,
	--  awful.layout.suit.corner.nw,
}

-- set layouts
awful.layout.layouts = Layouts

-- init theme
beautiful.init(_THEMES_DIR .. "/gruvbox/theme.lua")

-- menu
require("decoration.menu")

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
