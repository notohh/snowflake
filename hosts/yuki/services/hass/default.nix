_: {
  imports = [
    ./lovelace.nix
    ./config.nix
  ];

  nixpkgs.config.permittedInsecurePackages = ["openssl-1.1.1w"];

  services.home-assistant = {
    enable = true;
    openFirewall = true;
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
