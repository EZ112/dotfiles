---@diagnostic disable: need-check-nil, undefined-global

hl.window_rule({
	name = "ignore-max",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "xwayland-drag-fix",
	match = { class = "^$", title = "^$", xwayland = true, float = true },
	no_focus = true,
})

hl.window_rule({
	name = "discord",
	match = { class = "^(discord)$" },
	no_initial_focus = true,
	workspace = 10,
})

hl.window_rule({
	name = "ueberzugpp",
	match = { class = "^ueberzugpp_.*", title = "^ueberzugpp_.*" },
	float = true,
	pin = true,
	move = "((monitor_w-window_w)-10) 10",
	no_focus = true,
})

local f = io.popen("hostname")
local hostname = f:read("*l")
f:close()

local ok, err = pcall(require, hostname .. "/workspaces")
if not ok then
	error("No config found for host: " .. hostname .. "\n" .. err)
end
