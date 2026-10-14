_: {
  imports = [
    ./lovelace.nix
    ./config.nix
  ];
  networking.firewall.allowedTCPPorts = [ 8123 ];

  services.home-assistant = {
    enable = true;
    extraComponents = [
      "default_config"
      "met"
      "openweathermap"
      "esphome"
      "google_translate"
      "radio_browser"
      "sonarr"
      "radarr"
      "glances"
      "epson"
      "eufy"
      "hue"
      "nanoleaf"
    ];
  };
}
