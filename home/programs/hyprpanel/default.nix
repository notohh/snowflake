{inputs, ...}: {
  imports = [
    inputs.hyprpanel.homeManagerModules.hyprpanel
    inputs.sops-nix.homeManagerModules.sops
    ./settings.nix
  ];

  programs.hyprpanel = {
    enable = true;
    hyprland.enable = false;
    overwrite.enable = true;
    override = {
      "theme.bar.buttons.workspaces.hover" = "#7f849c";
      "theme.bar.buttons.workspaces.active" = "#f5c2e7";
      "theme.bar.buttons.workspaces.occupied" = "#f5c2e7";
      "theme.bar.buttons.workspaces.available" = "#585b70";
      "theme.bar.buttons.workspaces.border" = "#f9e2af";
      "theme.bar.buttons.dashboard.icon" = "#74c7ec";
      "theme.bar.buttons.media.icon" = "#1ED760";
      "bar.customModules.cava.showIcon" = false;
    };
  };
}
