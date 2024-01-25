_: {
  virtualisation.oci-containers.containers.glances = {
    image = "nicolargo/glances";
    ports = [
      "61208-61209:61208-61209"
    ];
    volumes = [
      "/var/run/docker.sock:/var/run/docker.sock"
    ];
    environment = {
      GLANCES_OPT = "-w";
    };
  };
}
