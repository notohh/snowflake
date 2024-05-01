{
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [./services/greetd.nix];
  environment = {
    systemPackages = with pkgs; [
      wayland
      glib
      grim
      slurp
      satty
      wl-clipboard
      wlr-randr
    ];
    sessionVariables = {
      __GL_GSYNC_ALLOWED = "0";
      __GL_VRR_ALLOWED = "0";
      WLR_DRM_NO_ATOMIC = "1";
      XDG_SESSION_TYPE = "wayland";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      GDK_BACKEND = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
      WLR_BACKEND = "vulkan";
      WLR_RENDERER = "vulkan";
      XCURSOR_SIZE = "24";
      NIXOS_OZONE_WL = "1";
      EDITOR = "hx";
      TERMINAL = "wezterm";
    };
    etc."greetd/environments".text = ''
      Hyprland
    '';
  };

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      inputs.xdg-portal-hyprland.packages.${pkgs.system}.default
    ];
    config = {
      common.default = "*";
    };
  };
}
