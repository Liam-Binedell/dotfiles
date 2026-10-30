-----------------------
---- LOOK AND FEEL ----
-----------------------

local active_color = "0xc8780ae6"
local inactive_color = "0x141414cc"
-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 5,

		border_size = 2,

		col = {
			active_border = active_color,
			inactive_border = inactive_color,
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 2,
		rounding_power = 1,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 0.7,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(ee1a1a1a)",
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			variant = "acrylic",
			vibrancy = 0.1696,
		},

		glow = {
			enabled = true,
			color = active_color,
			color_inactive = inactive_color,
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true,
	},
	master = {
		mfact = 0.5,
		new_status = "slave",
	},
	scrolling = {
		fullscreen_on_one_column = false,
		explicit_column_widths = "0.25, 0.333, 0.5, 0.667, 0.75, 1.0",
		direction = "right",
	},
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
	},
})
