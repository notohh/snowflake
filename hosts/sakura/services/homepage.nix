_: {
  virtualisation.oci-containers.containers.homepage = {
    image = "ghcr.io/benphelps/homepage:v0.6.21";
    volumes = [
      "/home/notoh/docker/homepage:/app/config"
      "/var/run/docker.sock:/var/run/docker.sock:ro"
    ];
    ports = [
      "3005:3000"
    ];
  };
}
