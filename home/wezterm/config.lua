local wezterm = require('wezterm')

local config = {

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
    window_padding = {top = 20, bottom = 20, left = 20, right = 20}
}

return config
