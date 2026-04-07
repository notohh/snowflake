{ pkgs, ... }:
{
  networking.firewall.allowedTCPPorts = [
    9292
    8111
    8085
    8181
  ];

  imports = [
    ./restic.nix
    ./torrent.nix
    ./syncthing.nix
  ];

  environment.systemPackages = [ pkgs.recyclarr ];
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
  };

  virtualisation.oci-containers.containers = {
    byparr = {
      image = "ghcr.io/thephaseless/byparr@sha256:dd2ab939fd616c17da5f58d85f5264e5ad125de1db732f3f27a4b52e96b78cbb"; # 2.0.1
      ports = [ "8191:8191" ];
      extraOptions = [ "--network=host" ];
    };
    shoko = {
      image = "ghcr.io/shokoanime/server@sha256:b841f8249c9edfba102e4072e2b2a3eae4179e5dd553f29e11b9898a44f1e836"; # v5.3.3
      ports = [ "8111:8111" ];
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
      extraOptions = [ "--network=host" ];
    };
    # sabnzbd = {
    #   image = "linuxserver/sabnzbd";
    #   ports = [ "9292:9292" ];
    #   environment = {
    #     PUID = "1000";
    #     PGID = "1000";
    #   };
    #   volumes = [
    #     "/var/lib/sabnzbd:/config"
    #     "/media/downloads:/media/downloads"
    #     "/media/incomplete-downloads:/media/incomplete-downloads"
    #   ];
    #   extraOptions = [ "--network=host" ];
    # };
  };
}
