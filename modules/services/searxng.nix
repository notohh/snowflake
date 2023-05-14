{...}: {
  virtualisation.oci-containers.containers.searxng = {
    image = "searxng/searxng";
    ports = ["8085:8080"];
    volumes = [
      "/home/notoh/docker/searxng:/etc/searxng:rw"
    ];
    environment = {
      INSTANCE_NAME = "test_instance";
    };
  };
}
