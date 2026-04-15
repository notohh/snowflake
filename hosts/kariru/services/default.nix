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
