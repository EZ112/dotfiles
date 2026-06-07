require("general")
require("keybinds")
require("workspaces")

-- Autostart
hl.on("hyprland.start", function()
	hl.exec_cmd("uwsm finalize")
	hl.exec_cmd("uwsm app -- waypaper --restore")
	hl.exec_cmd("uwsm app -- waybar")
	-- Clipboard
	hl.exec_cmd("uwsm app -- wl-paste --type text --watch cliphist store")
	hl.exec_cmd("uwsm app -- wl-paste --type image --watch cliphist store")
end)
