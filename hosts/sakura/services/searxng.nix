{...}: {
  virtualisation.oci-containers.containers.searxng = {
    image = "searxng/searxng";
    volumes = [
      "/home/notoh/docker/searxng:/etc/searxng:rw"
    ];
    environment = {
      INSTANCE_NAME = "SearXNG";
    };
    ports = [
      "8085:8080"
    ];
  };
}
