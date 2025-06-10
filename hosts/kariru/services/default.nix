{pkgs, ...}: {
  networking.firewall.allowedTCPPorts = [9292 8111 8085];

  imports = [
    ./restic.nix
    ./torrent.nix
    ./syncthing.nix
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
    sabnzbd.enable = true;
  };

  virtualisation.oci-containers.containers = {
    byparr = {
      image = "ghcr.io/thephaseless/byparr@sha256:9f83a6f5e5cec22a70abf3401a23164295a4b2e1ced37264907c3512981e527a"; # v3.3.21
      ports = ["8191:8191"];
      extraOptions = ["--network=host"];
    };
    shoko = {
      image = "ghcr.io/shokoanime/server@sha256:dde0c5a8bddc226ae368827fd7df382602ad312a2337ebade8e5cc63fa0c4dac"; # v5.1.0
      ports = ["8111:8111"];
      environment = {
        PUID = "1000";
        PGID = "1000";
        TZ = "Etc/UTC";
      };
      volumes = [
        "/var/lib/shoko:/home/shoko/.shoko"
        "/media/anime:/media/anime"
        "/media/anime-movies:/media/anime-movies"
      ];
      extraOptions = ["--network=host"];
    };
  };
}
