{pkgs, ...}: let
  dbus-hyprland-environment = pkgs.writeTextFile {
    name = "dbus-hyprland-environment";
    destination = "/bin/dbus-hyprland-environment";
    executable = true;
    text = ''
      dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=hyprland
      systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
      systemctl --user start pipewire wireplumber pipewire-media-session xdg-desktop-portal xdg-desktop-portal-hyprland
    '';
  };
in {
  imports = [
    ../../modules/greetd.nix
  ];

  environment.systemPackages = with pkgs; [
    dbus-hyprland-environment
    wayland
    glib
    grim
    slurp
    swappy
    wl-clipboard
    wlogout
    wlr-randr
    swayidle
    swaylock-effects
    swww
  ];

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  programs.xwayland.enable = true;

  environment.sessionVariables = rec {
    GBM_BACKEND = "nvidia-drm";
    __GL_GSYNC_ALLOWED = "0";
    __GL_VRR_ALLOWED = "0";
    WLR_DRM_NO_ATOMIC = "1";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    GDK_BACKEND = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_BACKEND = "vulkan";
    WLR_RENDERER = "vulkan";
    XCURSOR_SIZE = "24";
    NIXOS_OZONE_WL = "1";
    EDITOR = "hx";
  };

  environment.etc."greetd/environments".text = ''
    Hyprland
  '';
}
