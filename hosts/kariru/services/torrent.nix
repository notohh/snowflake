{config, ...}: {
  sops.secrets.gluetun = {};
  virtualisation.oci-containers.containers = {
    gluetun = {
      image = "qmcgaw/gluetun@sha256:5522794f5cce6d84bc7f06b1e3a3b836ede9100c64aec94543cb503bb2ecb72f"; #v3.38
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
      image = "linuxserver/qbittorrent@sha256:a4a72bd8e7891ec1ba01cfc5cfcb34b4d7b78c47a05ed8966cd18bd44a016894"; # v4.6.4
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
        "/media/incomplete-downloads:/incomplete-downloads"
      ];
      extraOptions = ["--network=container:gluetun"];
    };
  };
}
