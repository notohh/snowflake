{inputs, ...}: {
  imports = [
    inputs.hyprpanel.homeManagerModules.hyprpanel
    inputs.sops-nix.homeManagerModules.sops
    ./settings.nix
  ];

  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;
    hyprland.enable = false;
    overwrite.enable = true;
    theme = "catppuccin_mocha";
    layout = {
      "bar.layouts" = {
        "0" = {
          left = ["dashboard" "workspaces" "cava"];
          middle = ["media"];
          right = ["cpu" "ram" "volume" "clock" "systray" "notifications"];
        };
        "1" = {
          left = [];
          middle = [];
          right = [];
        };
        "2" = {
          left = [];
          middle = [];
          right = [];
        };
        "3" = {
          left = [];
          middle = [];
          right = [];
        };
      };
    };
  };
}
