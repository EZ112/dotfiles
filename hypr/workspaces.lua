local utils = require("utils")

local window_rules = {
	{
		name = "ignore-max",
		match = { class = ".*" },
		suppress_event = "maximize",
	},
	{
		name = "xwayland-drag-fix",
		match = { class = "^$", title = "^$", xwayland = true, float = true },
		no_focus = true,
	},
	{
		name = "discord",
		match = { class = "^(discord)$" },
		no_initial_focus = true,
		workspace = 10,
	},
}

utils.apply_all_rules({
	{ hl.window_rule, window_rules },
})

local hostname = nil
local f = io.popen("hostname")
if f then
	hostname = f:read("*l") or ""
	f:close()
end

if not hostname or hostname == "" then
	error("Could not determine hostname")
end

local ok, err = pcall(require, hostname .. "/workspaces")
if not ok then
	error("No config found for host: " .. hostname .. "\n" .. err)
end
