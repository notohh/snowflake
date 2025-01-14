{config, ...}: {
  sops.secrets.gluetun = {};
  virtualisation.oci-containers.containers = {
    gluetun = {
      image = "qmcgaw/gluetun@sha256:2b42bfa046757145a5155acece417b65b4443c8033fb88661a8e9dcf7fda5a00"; #v3.40
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
      extraOptions = ["--cap-add=NET_ADMIN" "--device=/dev/net/tun:/dev/net/tun"];
    };
    qbittorrent = {
      image = "linuxserver/qbittorrent@sha256:8e541cfd4dc991ba43901314b465067fe287728d7d6fd8ae911958d0b9df184c"; # v5.0.3
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
