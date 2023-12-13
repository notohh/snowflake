{...}: {
  imports = [
    ./traefik.nix
    ./torrent.nix
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
  services.readarr = {
    enable = true;
    openFirewall = true;
  };
  virtualisation.oci-containers.containers.whisparr = {
    image = "hotio/whisparr";
    ports = ["6969:6969"];
    volumes = [
      "/var/lib/whisparr:/config"
      "/stash:/data/stash"
      "/media/downloads:/data/downloads"
    ];
    extraOptions = ["--network=host"];
  };
}
