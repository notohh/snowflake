_: {
  imports = [
    ./traefik.nix
    ./torrent.nix
    ./prometheus.nix
  ];
  services.radarr = {
    enable = true;
    openFirewall = true;
    dataDir = "/var/lib/radarr";
  };

  services.sonarr = {
    enable = true;
    openFirewall = true;
    dataDir = "/var/lib/sonarr";
  };

  services.prowlarr = {
    enable = true;
    openFirewall = true;
  };
  services.bazarr = {
    enable = true;
    openFirewall = true;
  };
}
