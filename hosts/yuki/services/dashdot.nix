_: {
  virtualisation.oci-containers.containers.dashdot = {
    image = "mauricenino/dashdot:sha-4bef01c";
    ports = [
      "4000:3001"
    ];
    volumes = [
      "/home/notoh/docker/dashdot:/mnt/host:ro"
    ];
    environment = {
      DASHDOT_ENABLE_CPU_TEMPS = "true";
    };
  };
}
