{default, ...}: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
     local wezterm = require 'wezterm'

     return {
       front_end = "WebGpu",
       webgpu_preferred_adapter = {
        backend="Vulkan",
        device_type="DiscreteGpu",
        name="NVIDIA GeForce GTX 1070 Ti"
   },
       enable_wayland = false,
       font = wezterm.font 'Comic Code Ligatures',
       font_size = 12.0,
       hide_tab_bar_if_only_one_tab = true,
       color_scheme = 'Catppuccin Mocha',

       window_padding = {
        top = 0,
        bottom = 0,
        left = 0,
        right = 0, 
  }
}
'';
   };
}
