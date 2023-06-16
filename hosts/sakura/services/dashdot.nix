{...}: {
  virtualisation.oci-containers.containers.dashdot = {
    image = "mauricenino/dashdot:sha-207b2df";
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
