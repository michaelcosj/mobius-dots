local gears = require("gears")
local awful = require("awful")

local ckeys = gears.table.join(
	awful.key({ KEYS.modkey }, "f", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = "toggle fullscreen", group = "client" }),

	awful.key({ KEYS.modkey }, "q", function(c)
		c:kill()
	end, { description = "close", group = "client" }),

	awful.key(
		{ KEYS.modkey, KEYS.ctrl },
		"space",
		awful.client.floating.toggle,
		{ description = "toggle floating", group = "client" }
	),

	awful.key({ KEYS.modkey, KEYS.ctrl }, "Return", function(c)
		c:swap(awful.client.getmaster())
	end, { description = "move to master", group = "client" }),

	awful.key({ KEYS.modkey }, "o", function(c)
		c:move_to_screen()
	end, { description = "move to screen", group = "client" }),

	awful.key({ KEYS.modkey }, "t", function(c)
		c.ontop = not c.ontop
	end, { description = "toggle keep on top", group = "client" }),

	awful.key({ KEYS.modkey }, "n", function(c)
		-- The client currently has the input focus, so it cannot be
		-- minimized, since minimized clients can't have the focus.
		c.minimized = true
	end, { description = "minimize", group = "client" }),

	awful.key({ KEYS.modkey }, "m", function(c)
		c.maximized = not c.maximized
		c:raise()
	end, { description = "(un)maximize", group = "client" }),

	awful.key({ KEYS.modkey, KEYS.ctrl }, "m", function(c)
		c.maximized_vertical = not c.maximized_vertical
		c:raise()
	end, { description = "(un)maximize vertically", group = "client" }),

	awful.key({ KEYS.modkey, KEYS.shift }, "m", function(c)
		c.maximized_horizontal = not c.maximized_horizontal
		c:raise()
	end, { description = "(un)maximize horizontally", group = "client" })
)

return ckeys
