local awful = require("awful")
local beautiful = require("beautiful")

local bindings = require("bindings")

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
return {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			raise = true,
			titlebars_enabled = false,
			keys = bindings.clientkeys,
			buttons = bindings.clientbuttons,
			screen = awful.screen.preferred,
			focus = awful.client.focus.filter,
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	},

	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin", -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
				"Firefox",
				"qimgv",
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = {
			floating = true,
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
		},
	},

	-- Set Firefox to always map on the tag named "2" on screen 1.
	{
		rule = { class = "Firefox", name = "Mozilla Firefox" },
		properties = { tag = TAGS[3], switchtotag = false },
	},

	-- Set mpv to open in fullscreen and on tag 4
	{
		rule = { class = "mpv" },
		properties = { fullscreen = true, tag = TAGS[4], switchtotag = true },
	},

	{
		rule = { class = "Zathura" },
		properties = { tag = TAGS[5], switchtotag = false },
	},

	{
		rule = { class = "Transmission-gtk" },
		properties = { tag = TAGS[7], switchtotag = false },
	},
}
-- }}}
