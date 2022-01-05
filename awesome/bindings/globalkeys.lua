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
	awful.spawn.easy_async("/home/michael/.scripts/status volume", function(stdout, _, _, _)
		local perc = string.gsub(stdout, "\n", "")
		not_id = naughty.notify({ title = "Volume Info", text = perc, replaces_id = not_id }).id
	end)
end

-- Sends a system notification of brightness level
local function brightness_notify()
	awful.spawn.easy_async("/home/michael/.scripts/status brightness", function(stdout, _, _, _)
		local perc = string.gsub(stdout, "\n", "")
		not_id = naughty.notify({ title = "Brightness Info", text = perc, replaces_id = not_id }).id
	end)
end

--
-- Keybindings
--

local gkeys = gears.table.join(

	--[ Awesome ]--
	awful.key({ Keys.modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),

	awful.key({ Keys.modkey, Keys.ctrl }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),

	awful.key({ Keys.modkey, Keys.ctrl }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),

	--[ Tags ]--
	awful.key({ Keys.modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),

	awful.key({ Keys.modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),

	awful.key({ Keys.modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),

	awful.key({ Keys.modkey }, "j", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),

	awful.key({ Keys.modkey }, "k", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),

	--[ Layout manipulation ]--
	-- TODO: swap by direction
	awful.key({ Keys.modkey, Keys.shift }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),

	awful.key({ Keys.modkey, Keys.shift }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),

	awful.key({ Keys.modkey, Keys.ctrl }, "j", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),

	awful.key({ Keys.modkey, Keys.ctrl }, "k", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),

	awful.key(
		{ Keys.modkey },
		"u",
		awful.client.urgent.jumpto,
		{ description = "jump to urgent client", group = "client" }
	),

	awful.key({ Keys.modkey }, "Tab", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "go back", group = "client" }),

	awful.key({ Keys.modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),

	awful.key({ Keys.modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),

	awful.key({ Keys.modkey, Keys.shift }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),

	awful.key({ Keys.modkey, Keys.shift }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),

	awful.key({ Keys.modkey, Keys.ctrl }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),

	awful.key({ Keys.modkey, Keys.ctrl }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),

	awful.key({ Keys.modkey }, "space", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),

	awful.key({ Keys.modkey, Keys.shift }, "space", function()
		awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),

	awful.key({ Keys.modkey, Keys.ctrl }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),

	--[ Launching Programs ]--
	-- Terminal
	awful.key({ Keys.modkey }, "Return", function()
		awful.spawn(Apps.terminal)
	end, { description = "open a terminal", group = "launcher" }),

	-- Web browser
	awful.key({ Keys.modkey }, "w", function()
		awful.spawn(Apps.browser)
	end, { description = "open browser", group = "launcher" }),

	-- File manager
	awful.key({ Keys.modkey, Keys.alt }, "f", function()
		awful.spawn(Apps.filemanager)
	end, { description = "open file manager", group = "launcher" }),

	-- Editor
	awful.key({ Keys.modkey, Keys.shift }, "e", function()
		awful.spawn(Apps.editor)
	end, { description = "open editor", group = "launcher" }),

	-- Increase brightness
	awful.key({}, "XF86MonBrightnessUp", function()
		awful.spawn(bri_set_cmd .. "+5%")
		brightness_notify()
	end, { description = "Increase brightness", group = "launcher" }),

	-- Decrease brightness
	awful.key({}, "XF86MonBrightnessDown", function()
		awful.spawn(bri_set_cmd .. "5%-")
		brightness_notify()
	end, { description = "Decrease brightness", group = "launcher" }),

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

	-- Take screenshot
	awful.key({}, "Print", function()
		awful.spawn(Apps.screenshot_utility)
	end, { description = "Take screenshot", group = "launcher" }),

	-- Prompt
	awful.key({ Keys.modkey }, "p", function()
		awful.spawn("rofi -show drun")
	end, { description = "run rofi prompt", group = "launcher" }),

	-- Opened Windows
	awful.key({ Keys.modkey, Keys.alt }, "w", function()
		awful.spawn("rofi -show window")
	end, { description = "rofi windows", group = "launcher" }),

	-- Emoji menu
	awful.key({ Keys.modkey, Keys.alt }, "e", function()
		awful.spawn("rofi -show emoji")
	end, { description = "rofi emoji menu", group = "launcher" }),

	-- Calculator
	awful.key({ Keys.modkey, Keys.alt }, "c", function()
		awful.spawn("rofi -show calc")
	end, { description = "rofi calculator", group = "launcher" }),

	-- Rofi run prompt
	awful.key({ Keys.modkey, Keys.alt }, "x", function()
		awful.spawn("rofi -show run")
	end, { description = "rofi run prompt", group = "launcher" }),

	-- Prompt
	awful.key({ Keys.modkey, Keys.shift }, "q", function()
		awful.spawn.with_shell(Scripts_dir .. "/rofi-power-menu-script.sh")
	end, { description = "run rofi power menu", group = "launcher" })
)

--
-- Bind keys to tags
--

for i = 1, 9 do
	gkeys = gears.table.join(
		gkeys,
		-- View tag only.
		awful.key({ Keys.modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag #" .. i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ Keys.modkey, Keys.ctrl }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag #" .. i, group = "tag" }),
		-- Move client to tag.
		awful.key({ Keys.modkey, Keys.shift }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ Keys.modkey, Keys.ctrl, Keys.shift }, "#" .. i + 9, function()
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
