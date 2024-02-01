{config, ...}: {
  sops.secrets.gluetun = {};
  virtualisation.oci-containers.containers = {
    gluetun = {
      image = "qmcgaw/gluetun@sha256:e15ede3ce007e3f6e3f6532c7d8d6051f4bb0dca4bb3c5edd7aa3316916e9990"; #v3.37.0
      hostname = "gluetun";
      ports = [
        "8000:8000/tcp" # HTTP control server
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
      image = "linuxserver/qbittorrent@sha256:c388ef02586a7d37c708c63eef069025663f4ac99cd29c9480bc34018d8b4194"; # v4.6.3
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
