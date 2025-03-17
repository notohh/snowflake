{pkgs, ...}: {
  home.packages = with pkgs; [
    television
    nix-search-tv
  ];
  xdg.configFile."television/config.toml".source = ./config.toml;
  # xdg.configFile."television/default_channels.toml".source = ./config.toml;
  xdg.configFile."nix-search-tv/config.json".source = ./config.json;
}
