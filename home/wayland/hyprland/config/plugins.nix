{
  pkgs,
  inputs,
  ...
}:
{
  wayland.windowManager.hyprland.plugins = [
    inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.csgo-vulkan-fix
  ];
  wayland.windowManager.hyprland.settings = {
    plugin = {
      csgo-vulkan-fix = {
        res_w = 1280;
        res_h = 1024;
        class = "cs2";
        fix_mouse = true;
      };
    };
  };
}
