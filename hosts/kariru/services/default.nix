{pkgs, ...}: {
  networking.firewall.allowedTCPPorts = [9292];

  imports = [
    ./restic.nix
    ./torrent.nix
  ];

  environment.systemPackages = [pkgs.recyclarr];
  services = {
    radarr = {
      enable = true;
      openFirewall = true;
    };
    sonarr = {
      enable = true;
      openFirewall = true;
    };
    prowlarr = {
      enable = true;
      openFirewall = true;
    };
    bazarr = {
      enable = true;
      openFirewall = true;
    };
    readarr = {
      enable = true;
      openFirewall = true;
    };
    lidarr = {
      enable = true;
      openFirewall = true;
    };
    sabnzbd.enable = true;
  };

  virtualisation.oci-containers.containers = {
    whisparr = {
      image = "ghcr.io/hotio/whisparr@sha256:d66f5dc01af747881e25b8e72aa45de30fba672c16df897af69257704fb61fe4"; # v3-3.0.0.545
      ports = ["6969:6969"];
      volumes = [
        "/var/lib/whisparr:/config"
        "/stash:/media/stash"
        "/media/downloads:/media/downloads"
      ];
      extraOptions = ["--network=host"];
    };
    flaresolverr = {
      image = "ghcr.io/flaresolverr/flaresolverr@sha256:5f5661db1e69a6f80ac24d47d9fa5580f6f741ee5ec967818396ae0dacecd7ea"; # v3.3.17
      ports = ["8191:8191"];
      extraOptions = ["--network=host"];
    };
  };
}
