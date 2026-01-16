_: {
  virtualisation.oci-containers.containers.multiscrobbler = {
    image = "foxxmd/multi-scrobbler@sha256:489684af568507ab33de0befd1138cd5c815b2fa6c728ab968516053495d609f"; # 0.11.0
    ports = [ "9078:9078" ];
    environment = {
      TZ = "Etc/US";
      PUID = "1000";
      PGID = "1000";
    };
    volumes = [
      "/var/lib/multiscrobbler:/config"
    ];
  };
}
