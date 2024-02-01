{pkgs, ...}: {
  networking.firewall.allowedTCPPorts = [9292];
  imports = [
    ./restic.nix
    ./torrent.nix
  ];
  environment.systemPackages = [pkgs.recyclarr];
  services.radarr = {
    enable = true;
    openFirewall = true;
  };

  services.sonarr = {
    enable = true;
    openFirewall = true;
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
      image = "ghcr.io/hotio/whisparr@sha256:88b91920b77339e2deda418960be28868df538413abea6cdddaf4013e43c4c0f"; # v3-3.0.0.425
      ports = ["6969:6969"];
      volumes = [
        "/var/lib/whisparr:/config"
        "/stash:/media/stash"
        "/media/downloads:/media/downloads"
      ];
      extraOptions = ["--network=host"];
    };
    flaresolverr = {
      image = "ghcr.io/flaresolverr/flaresolverr@sha256:213bb58aa341a0188e64ce2c21e1c5748b167c719828bc61dd904eb0fb1aec63"; # v3.3.13
      ports = ["8191:8191"];
      extraOptions = ["--network=host"];
    };
  };
}
