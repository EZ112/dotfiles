---@diagnostic disable: undefined-global
--------------------
---- MONITORS ----
--------------------

hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	scale = 1.25,
})

-----------------------
---- WORKSPACES ----
-----------------------

hl.workspace_rule({ workspace = "1", monitor = "eDP-1", default = true })

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("uwsm app -- brave")
	hl.exec_cmd("uwsm app -- alacritty")
end)

-----------------------
---- WINDOW RULES ----
-----------------------

hl.window_rule({
	name = "alacritty",
	match = { class = "^(Alacritty)$" },
	workspace = "1",
})

hl.window_rule({
	name = "brave-browser",
	match = { class = "^(brave-browser)$" },
	no_initial_focus = true,
	workspace = "2",
})

hl.window_rule({
	name = "picture-in-picture",
	match = { title = "^[Pp]icture\\s*-?\\s*[Ii]n\\s*-?\\s*[Pp]icture$" },
	float = true,
	pin = true,
	move = "((monitor_w-window_w)-10) ((monitor_h-window_h)-10)",
	workspace = "1",
})
