_: {
  virtualisation.oci-containers.containers.glances = {
    image = "nicolargo/glances@sha256:b6908ea9d3dcb99d82114bc5fb6fc3b4ae515025427f96cc9125609c11f46651"; #v3.4.0.5
    ports = ["61208-61209:61208-61209"];
    volumes = ["/var/run/docker.sock:/var/run/docker.sock"];
    environment = {
      GLANCES_OPT = "-w";
    };
  };
}
