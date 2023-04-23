{...}: {
  services.dunst = {
    enable = true;
    waylandDisplay = "DP-2";
    settings = ./config.nix;
  };
}
