local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
local awful = require("awful")
local naughty = require("naughty")
local menubar = require("menubar")

local not_id -- notification id

local bri_set_cmd = "brightnessctl -d 'intel_backlight' set "
local vol_set_cmd = "pamixer "

--
-- Helper functions
--

-- Sends a system notification of volume level
local function volume_notify()
	awful.spawn.easy_async(_SCRIPTS_DIR .. "/status volume", function(stdout, _, _, _)
		local perc = string.gsub(stdout, "\n", "")
		not_id = naughty.notify({ title = "Volume Info", text = perc, replaces_id = not_id }).id
	end)
end

-- Sends a system notification of brightness level
local function brightness_notify()
	awful.spawn.easy_async(_SCRIPTS_DIR .. "/status brightness", function(stdout, _, _, _)
		local perc = string.gsub(stdout, "\n", "")
		not_id = naughty.notify({ title = "Brightness Info", text = perc, replaces_id = not_id }).id
	end)
end

--
-- Keybindings
--

local gkeys = gears.table.join(

	--[ Awesome ]--
	awful.key({ KEYS.modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),

	awful.key({ KEYS.modkey, KEYS.ctrl }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),

	awful.key({ KEYS.modkey, KEYS.ctrl }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),

	--[ Tags ]--
	awful.key({ KEYS.modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),

	awful.key({ KEYS.modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),

	awful.key({ KEYS.modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),

	awful.key({ KEYS.modkey }, "j", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),

	awful.key({ KEYS.modkey }, "k", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),

	--[ Layout manipulation ]--
	-- TODO: swap by direction
	awful.key({ KEYS.modkey, KEYS.shift }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),

	awful.key({ KEYS.modkey, KEYS.shift }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),

	awful.key({ KEYS.modkey, KEYS.ctrl }, "j", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),

	awful.key({ KEYS.modkey, KEYS.ctrl }, "k", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),

	awful.key(
		{ KEYS.modkey },
		"u",
		awful.client.urgent.jumpto,
		{ description = "jump to urgent client", group = "client" }
	),

	awful.key({ KEYS.modkey }, "Tab", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "go back", group = "client" }),

	awful.key({ KEYS.modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),

	awful.key({ KEYS.modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),

	awful.key({ KEYS.modkey, KEYS.shift }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),

	awful.key({ KEYS.modkey, KEYS.shift }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),

	awful.key({ KEYS.modkey, KEYS.ctrl }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),

	awful.key({ KEYS.modkey, KEYS.ctrl }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),

	awful.key({ KEYS.modkey }, "space", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),

	awful.key({ KEYS.modkey, KEYS.shift }, "space", function()
		awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),

	awful.key({ KEYS.modkey, KEYS.ctrl }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),

	--[ System ]--
	-- [ Brightness ]--
	-- increase brightness
	awful.key({}, "XF86MonBrightnessUp", function()
		awful.spawn(bri_set_cmd .. "+5%")
		brightness_notify()
	end, { description = "Increase brightness", group = "launcher" }),

	-- Decrease brightness
	awful.key({}, "XF86MonBrightnessDown", function()
		awful.spawn(bri_set_cmd .. "5%-")
		brightness_notify()
	end, { description = "Decrease brightness", group = "launcher" }),

	-- [ Volume ]--
	-- Increase volume
	awful.key({}, "XF86AudioRaiseVolume", function()
		awful.spawn(vol_set_cmd .. "-i 5")
		volume_notify()
	end, { description = "Increase volume", group = "launcher" }),

	-- Decrease volume
	awful.key({}, "XF86AudioLowerVolume", function()
		awful.spawn(vol_set_cmd .. "-d 5")
		volume_notify()
	end, { description = "Decrease volume", group = "launcher" }),

	-- Mute sound
	awful.key({}, "XF86AudioMute", function()
		awful.spawn(vol_set_cmd .. "-t")
		volume_notify()
	end, { description = "Mute sound", group = "launcher" })
)

--
-- Bind keys to tags
--

for i = 1, 9 do
	gkeys = gears.table.join(
		gkeys,
		-- View tag only.
		awful.key({ KEYS.modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag #" .. i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ KEYS.modkey, KEYS.ctrl }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag #" .. i, group = "tag" }),
		-- Move client to tag.
		awful.key({ KEYS.modkey, KEYS.shift }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ KEYS.modkey, KEYS.ctrl, KEYS.shift }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end

return gkeys
