{ config, ... }:
{
  sops.secrets.gluetun = { };
  virtualisation.oci-containers.containers = {
    gluetun = {
      image = "qmcgaw/gluetun@sha256:1a5bf4b4820a879cdf8d93d7ef0d2d963af56670c9ebff8981860b6804ebc8ab"; # v3.41.1
      hostname = "gluetun";
      ports = [
        "8000:8000/tcp" # HTTP control server
        "8888:8888/tcp" # HTTP proxy
        "8388:8388/tcp" # Shadowsocks
        "8388:8388/udp" # Shadowsocks

        # qb
        "8080:8080"
        "6881:6881"
        "6881:6881/udp"

        # slskd
        "5030:5030"
      ];
      volumes = [ "/srv/gluetun:/tmp/gluetun" ];
      environmentFiles = [ config.sops.secrets.gluetun.path ];
      extraOptions = [
        "--cap-add=NET_ADMIN"
        "--device=/dev/net/tun:/dev/net/tun"
      ];
    };
    qbittorrent = {
      image = "linuxserver/qbittorrent@sha256:a89108b1bf43de072a35a59a3ee41b97b564538faae5cbb3f6c803aa7f5fd9f7"; # v5.1.4
      dependsOn = [ "gluetun" ];
      environment = {
        PUID = "1001";
        PGID = "2001";
        TZ = "Etc/UTC";
        WEBUI_PORT = "8080";
      };
      volumes = [
        "/home/notoh/qbittorrent/config:/config"
        "/media/downloads:/downloads"
        "/media/incomplete-downloads:/incomplete-downloads"
      ];
      extraOptions = [ "--network=container:gluetun" ];
    };
  };
}
