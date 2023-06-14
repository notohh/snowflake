_: {
  virtualisation.oci-containers.containers.searxng = {
    image = "searxng/searxng:2023.6.10-5f11155c";
    volumes = [
      "/home/notoh/docker/searxng:/etc/searxng:rw"
    ];
    environment = {
      INSTANCE_NAME = "SearXNG";
    };
    ports = [
      "8100:8080"
    ];
  };
}
