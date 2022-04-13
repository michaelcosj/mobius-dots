local awful = require("awful")

local wifi_widget, _ = awful.widget.watch(_SCRIPTS_DIR .. "/status net", 2)

wifi_widget:connect_signal("button::press", function()
	awful.spawn(APPS.terminal .. " nmtui", {
		floating = true,
		width = 700,
		height = 700,
		placement = awful.placement.centered,
	})
end)

return wifi_widget
