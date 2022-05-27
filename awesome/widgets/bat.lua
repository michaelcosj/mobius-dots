local awful = require("awful")
local naughty = require("naughty")
local beautiful = require("beautiful")

local notify_preset = {
	title = "Battery Info",
	timeout = 5,
}

local BAT_FULL = 100
local BAT_LOW = 30
local BAT_CRITICAL = 15

local bat_id
local notified_full = false
local notified_low = false
local notified_critical = false

local function notify_state_reset(perc)
	-- Reset notified status
	if perc < BAT_FULL then
		notified_full = false
	end

	if perc > BAT_LOW then
		notified_low = false
	end

	if perc > BAT_CRITICAL then
		notified_critical = false
	end
end

local function notify(perc)
	-- Notify if Battery is full, low or at critical levels
	if perc == BAT_FULL and not notified_full then
		bat_id = naughty.notify({
			preset = notify_preset,
			text = "Battery Fully Charged, You Can Stop Charging",
			replaces_id = bat_id,
		}).id
		notified_full = true
	end
	if perc <= BAT_LOW and not notified_low then
		bat_id = naughty.notify({
			preset = notify_preset,
			text = "Battery Low, Plug in Charger",
			fg = beautiful.fg_urgent,
			border_color = beautiful.border_urgent,
			replaces_id = bat_id,
		}).id
		notified_low = true
	end
	if perc <= BAT_CRITICAL and not notified_critical then
		bat_id = naughty.notify({
			preset = notify_preset,
			text = "Battery Critical, Plug in Charger Now",
			fg = beautiful.fg_urgent,
			border_color = beautiful.border_urgent,
			replaces_id = bat_id,
		}).id
		notified_critical = true
	end

	notify_state_reset(perc)
end

local bat_widget, _ = awful.widget.watch(_SCRIPTS_DIR .. "/status bat", 2, function(widget, stdout)
	local perc = tonumber(string.match(stdout, "%d+"))
	if perc == nil then
		widget:set_text("nil")
		return
	end

	notify(perc)
	widget:set_text(stdout)
end)

bat_widget:connect_signal("button::press", function()
	awful.spawn.easy_async("acpi", function(stdout, _, _, _)
		local info = string.gsub(stdout, "\n", "")
		naughty.notify({ title = "Battery Info", text = info })
	end)
end)

return bat_widget
