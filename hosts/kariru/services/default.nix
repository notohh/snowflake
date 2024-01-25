{pkgs, ...}: {
  networking.firewall.allowedTCPPorts = [9292];
  imports = [
    ./restic.nix
    ./traefik.nix
    ./torrent.nix
  ];
  environment.systemPackages = [pkgs.recyclarr];
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

  services.readarr = {
    enable = true;
    openFirewall = true;
  };

  services.lidarr = {
    enable = true;
    openFirewall = true;
  };

  services.sabnzbd.enable = true;

  virtualisation.oci-containers.containers = {
    whisparr = {
      image = "ghcr.io/hotio/whisparr:v3-b7c95ec";
      ports = ["6969:6969"];
      volumes = [
        "/var/lib/whisparr:/config"
        "/stash:/media/stash"
        "/media/downloads:/media/downloads"
      ];
      extraOptions = ["--network=host"];
    };
    flaresolverr = {
      image = "ghcr.io/flaresolverr/flaresolverr:v3.3.13";
      ports = ["8191:8191"];
      extraOptions = ["--network=host"];
    };
  };
}
