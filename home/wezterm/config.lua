local wezterm = require 'wezterm'

return {
    front_end = "WebGpu",
    webgpu_preferred_adapter = {
        backend = "Vulkan",
        device_type = "DiscreteGpu",
        name = "NVIDIA GeForce GTX 1070 Ti"
    },
    enable_wayland = false,
    font = wezterm.font 'Monaspace Krypton',
    font_size = 12.0,
    window_background_opacity = 0.6,
    text_background_opacity = 1.0,
    enable_tab_bar = false,
    color_scheme = 'tokyonight',

    window_padding = { top = 0, bottom = 0, left = 0, right = 0 }
}
