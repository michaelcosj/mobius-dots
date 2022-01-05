local awful = require("awful")

local wifi_widget, _ = awful.widget.watch("/home/michael/.scripts/status net", 2)

wifi_widget:connect_signal("button::press", function()
	awful.spawn(Apps.terminal .. " nmtui", {
		floating = true,
		width = 500,
		height = 500,
		placement = awful.placement.centered,
	})
end)

return wifi_widget
