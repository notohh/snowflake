{...}: {
  virtualisation.oci-containers.containers.dashdot = {
    image = "mauricenino/dashdot";
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
