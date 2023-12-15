{config, ...}: {
  sops.secrets.gluetun = {};
  virtualisation.oci-containers.containers = {
    gluetun = {
      image = "qmcgaw/gluetun:pr-1742";
      ports = [
        "8888:8888/tcp" # HTTP proxy
        "8388:8388/tcp" # Shadowsocks
        "8388:8388/udp" # Shadowsocks
        "8080:8080" #qb
        "6881:6881" #qb
        "6881:6881/udp" #qb
      ];
      environmentFiles = [config.sops.secrets.gluetun.path];
      extraOptions = ["--cap-add=NET_ADMIN"];
    };
    qbittorrent = {
      image = "linuxserver/qbittorrent:4.6.2";
      dependsOn = ["gluetun"];
      environment = {
        PUID = "1001";
        PGID = "2001";
        TZ = "Etc/UTC";
        WEBUI_PORT = "8080";
      };
      volumes = [
        "/home/notoh/qbittorrent/config:/config"
        "/media/downloads:/downloads"
      ];
      extraOptions = ["--network=container:gluetun"];
    };
  };
}
