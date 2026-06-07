-- General
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

-- Animation
hl.curve("b0", { type = "bezier", points = { { 0, 1 }, { 0, 1.025 } } })
hl.curve("b1", { type = "bezier", points = { { 0, 1.1 }, { 0, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "b1", style = "slide" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4, bezier = "b0", style = "popin 88%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, bezier = "b0", style = "slide" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "default", style = "slide" })
