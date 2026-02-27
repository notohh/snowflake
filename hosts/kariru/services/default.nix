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
    sabnzbd = {
      enable = false;
      allowConfigWrite = true;
    };
  };

  virtualisation.oci-containers.containers = {
    byparr = {
      image = "ghcr.io/thephaseless/byparr@sha256:dd2ab939fd616c17da5f58d85f5264e5ad125de1db732f3f27a4b52e96b78cbb"; # 2.0.1
      ports = [ "8191:8191" ];
      extraOptions = [ "--network=host" ];
    };
    shoko = {
      image = "ghcr.io/shokoanime/server@sha256:1be8caa29de78dc14082ad0d672a9a4ef809adf5ceef33bbfad9d0262ff452c6"; # v5.2.1
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
  };
}
