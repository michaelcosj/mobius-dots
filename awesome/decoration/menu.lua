---@diagnostic disable: undefined-global
local awful = require("awful")
local beautiful = require("beautiful")

local myawesomemenu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", APPS.terminal .. " -e man awesome" },
	{ "edit config", APPS.editor .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

local internet = {
	{ "Firefox", "firefox" },
	{ "Qutebrowser", "qutebrowser" },
	{ "Discord", "Discord" },
}

local multimedia = {
	{ "Transmission", "transmission-gtk" },
	{ "Simple Screen Recorder", "simplescreenrecorder" },
	{ "gMTP", "gmtp" },
}

local tools = {
	{ "Neovim", "nvim" },
	{ "Htop", "htop" },
	{ "Thunar", "thunar" },
}

local appsmenu = {
	{ "Internet", internet },
	{ "Multimedia", multimedia },
	{ "Tools", tools },
}

Mainmenu = awful.menu({
	items = {
		{ "awesome", myawesomemenu, beautiful.awesome_icon },
		{ "apps", appsmenu },
		{ "open terminal", APPS.terminal },
		{
			"power menu",
			_SCRIPTS_DIR .. "./rofi-power-menu-script.sh",
		},
	},
})

-- local launcher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = Mainmenu })
