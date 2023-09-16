_: {
  virtualisation.oci-containers.containers.homarr = {
    image = "ghcr.io/ajnart/homarr:0.13.4";
    ports = [
      "7575:7575"
    ];
    volumes = [
      "/home/notohh/docker/homarr/configs:/app/data/configs"
      "/home/notohh/docker/homarr/icons:/app/public/icons"
    ];
  };
}
