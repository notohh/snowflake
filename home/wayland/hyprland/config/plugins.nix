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
        vkfix-app = "cs2, 1280, 1024";
        fix_mouse = true;
      };
    };
  };
}
