local awful = require("awful")
local beautiful = require("beautiful")

myawesomemenu = {
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

internet = {
	{ "Firefox", "firefox" },
	{ "Qutebrowser", "qutebrowser" },
	{ "Discord", "Discord" },
}

multimedia = {
	{ "Transmission", "transmission-gtk" },
	{ "Simple Screen Recorder", "simplescreenrecorder" },
	{ "gMTP", "gmtp" },
}

tools = {
	{ "Neovim", "nvim" },
	{ "Htop", "htop" },
	{ "PCManFm", "pcmanfm" },
}

appsmenu = {
	{ "Internet", internet },
	{ "Multimedia", multimedia },
	{ "Tools", tools },
}

mymainmenu = awful.menu({
	items = {
		{ "awesome", myawesomemenu, beautiful.awesome_icon },
		{ "apps", appsmenu },
		{ "open terminal", APPS.terminal },
	},
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
