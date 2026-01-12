{ config, ... }:
{
  sops.secrets.gluetun = { };
  virtualisation.oci-containers.containers = {
    gluetun = {
      image = "qmcgaw/gluetun@sha256:6b54856716d0de56e5bb00a77029b0adea57284cf5a466f23aad5979257d3045"; # v3.41.0
      hostname = "gluetun";
      ports = [
        "8000:8000/tcp" # HTTP control server
        "8888:8888/tcp" # HTTP proxy
        "8388:8388/tcp" # Shadowsocks
        "8388:8388/udp" # Shadowsocks
        "8080:8080" # qb
        "6881:6881" # qb
        "6881:6881/udp" # qb
      ];
      volumes = [ "/srv/gluetun:/tmp/gluetun" ];
      environmentFiles = [ config.sops.secrets.gluetun.path ];
      extraOptions = [
        "--cap-add=NET_ADMIN"
        "--device=/dev/net/tun:/dev/net/tun"
      ];
    };
    qbittorrent = {
      image = "linuxserver/qbittorrent@sha256:95114034a7f74672b76f795f6938921b0ca795f85b59b48691035dc66714f34c"; # v5.1.4
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
