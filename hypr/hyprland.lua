---@diagnostic disable: undefined-global, need-check-nil
require("workspaces")

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "alacritty"
local fileManager = "pcmanfm"
local menu = "rofi -show drun -run-command 'uwsm app -- {cmd}'"

-------------------
---- AUTOSTART ----
-------------------

local function has_video_in_dir(dir)
	local extensions = { "mp4" }

	for _, ext in ipairs(extensions) do
		local cmd = io.popen('find "' .. dir .. '" -maxdepth 1 -name "*.' .. ext .. '" | head -1')
		local result = cmd:read("*l")
		cmd:close()
		if result and result ~= "" then
			return true, result
		end
	end

	return false, nil
end

local home = os.getenv("HOME")
local found, file = has_video_in_dir(home .. "/dotfiles/wallpapers")

hl.on("hyprland.start", function()
	hl.exec_cmd("uwsm finalize")
	if found then
		hl.exec_cmd("uwsm app -- mpvpaper -p -o 'no-audio hwdec=auto hwdec-codecs=all cache=no loop' '*' " .. file)
	else
		hl.exec_cmd("uwsm app -- awww-daemon")
	end

	hl.exec_cmd("uwsm app -- waybar")
	hl.exec_cmd("uwsm app -- discord")
	-- Clipboard
	hl.exec_cmd("uwsm app -- wl-paste --type text --watch cliphist store")
	hl.exec_cmd("uwsm app -- wl-paste --type image --watch cliphist store")
end)

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
	general = {
		gaps_in = 4,
		gaps_out = 4,
		border_size = 0,
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 4,
		active_opacity = 0.8,
		inactive_opacity = 0.4,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 8,
			passes = 1,
			ignore_opacity = true,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		allow_small_split = true,
		new_on_top = true,
		drop_at_cursor = false,
		smart_resizing = false,
	},

	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 0,

		touchpad = {
			natural_scroll = false,
		},
	},

	cursor = {
		no_hardware_cursors = 1,
	},
})

--------------------
---- ANIMATIONS ----
--------------------

hl.curve("b0", { type = "bezier", points = { { 0, 1 }, { 0, 1.025 } } })
hl.curve("b1", { type = "bezier", points = { { 0, 1.1 }, { 0, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "b1", style = "slide" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4, bezier = "b0", style = "popin 88%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, bezier = "b0", style = "slide" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "default", style = "slide" })

--------------------
---- KEYBINDINGS ---
--------------------

local mainMod = "SUPER"

-- Applications
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("hyprlock"))

-- Rofi launchers
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("rofi -show run"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("rofi -show window"))
hl.bind(mainMod .. " + Super_L", hl.dsp.exec_cmd(menu), { release = true })

-- Move focus (vim-style)
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))

-- Switch workspaces
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through workspaces with mouse
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Screenshot
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))

-- Move windows (keyboard)
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))

-- Move/resize windows with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-------------------------------
---- MULTIMEDIA / HARDWARE ----
-------------------------------

-- Volume
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })

-- Volume OSD (dunst notification)
local volumeDunst =
	"dunstify -h string:x-dunst-stack-tag:volume -h int:value:\"$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')\" \"Volume: $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')%\""
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(volumeDunst), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(volumeDunst), { locked = true, repeating = true })

-- Brightness
local brightnessDunst =
	'dunstify -h string:x-dunst-stack-tag:brightness -h int:value:"$(brightnessctl -m | cut -d, -f4 | tr -d %)" "Brightness: $(brightnessctl -m | cut -d, -f4 | tr -d %)%"'
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("brightnessctl s 10%+ && " .. brightnessDunst),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("brightnessctl s 10%- && " .. brightnessDunst),
	{ locked = true, repeating = true }
)

-- Media controls
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
