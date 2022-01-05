local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")

local widgets = require("widgets")

widgets.systray = wibox.widget.systray()
widgets.textclock = wibox.widget.textclock()

local set_wallpaper = require("decoration.set_wallpaper")

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
	set_wallpaper(s)

	-- Each screen has its own tag table.
	awful.tag(Tags, s, awful.layout.layouts[1])

	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))

	s.mywibox = awful.wibar({ position = "top", screen = s })
	s.promptbox = awful.widget.prompt(s)

	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{
			layout = wibox.layout.fixed.horizontal,
			--			mylauncher,
			widgets.taglist(s),
			s.promptbox,
		},
		widgets.tasklist(s),
		{
			layout = wibox.layout.fixed.horizontal,
			widgets.bat,
			widgets.wifi,
			widgets.textclock,
			widgets.systray,
			s.mylayoutbox,
		},
	})
end)
