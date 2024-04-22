{
  pkgs,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
    ];
    plugin = {
      hyprexpo = {
        columns = 3;
        gap_size = 5;
        bg_col = "rgb(111111)";
        workspace_method = "center current";
      };
    };
  };
}
