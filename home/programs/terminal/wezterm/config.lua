local wezterm = require("wezterm")

local config = {

	front_end = "WebGpu",
	webgpu_preferred_adapter = {
		backend = "Vulkan",
		device_type = "DiscreteGpu",
		name = "NVIDIA GeForce GTX 1070 Ti",
	},
	color_scheme = "Tokyo Night",
	enable_wayland = false,
	font = wezterm.font("JetBrainsMono NF Medium"),
	font_size = 12.0,
	window_background_opacity = 0.6,
	text_background_opacity = 1.0,
	enable_tab_bar = false,
	window_padding = { top = 20, bottom = 20, left = 20, right = 20 },
}

return config
