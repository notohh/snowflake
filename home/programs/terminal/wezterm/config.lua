local wezterm = require("wezterm")

local config = {

	front_end = "WebGpu",
	webgpu_preferred_adapter = {
		backend = "Vulkan",
		device_type = "DiscreteGpu",
		name = "AMD Radeon RX 6750 XT (RADV NAVI22)",
	},

	color_scheme = "Tokyo Night",
	enable_wayland = false,
	font = wezterm.font_with_fallback({ "JetBrainsMono NF Medium", "Comic Code Ligatures Medium" }),
	font_size = 12.0,
	window_background_opacity = 0.6,
	text_background_opacity = 1.0,
	enable_tab_bar = false,
	window_padding = { top = 20, bottom = 20, left = 20, right = 20 },
}

return config
