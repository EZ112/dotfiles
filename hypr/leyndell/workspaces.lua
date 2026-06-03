---@diagnostic disable: undefined-global
--------------------
---- MONITORS ----
--------------------

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

--------------------------
---- WORKSPACE RULES ----
--------------------------

hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-3", default = true })
hl.workspace_rule({ workspace = "3", monitor = "DP-3" })
hl.workspace_rule({ workspace = "4", monitor = "DP-3" })
hl.workspace_rule({ workspace = "5", monitor = "DP-3" })
hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "10", monitor = "HDMI-A-1" })

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("uwsm app -- brave")
	hl.exec_cmd("uwsm app -- alacritty")
end)

--------------------
---- WINDOW RULES --
--------------------

hl.window_rule({
	name = "picture-in-picture",
	match = { title = "^[Pp]icture\\s*-?\\s*[Ii]n\\s*-?\\s*[Pp]icture$" },
	float = true,
	pin = true,
	move = "((monitor_w-window_w)-10) ((monitor_h-window_h)-10)",
	workspace = 2,
})

hl.window_rule({
	name = "brave-browser",
	match = { class = "^(brave-browser)$" },
	no_initial_focus = true,
	workspace = 1,
})

hl.window_rule({
	name = "alacritty",
	match = { class = "^(Alacritty)$" },
	workspace = 2,
})

-----------------
---- DEVICES ----
-----------------

hl.device({
	name = "wacom-hid-521c-finger",
	enabled = false,
})

hl.device({
	name = "hid-256c:006d",
	output = "DP-3",
})
