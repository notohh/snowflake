_: {
  virtualisation.oci-containers.containers.wallos = {
    image = "bellamy/wallos@sha256:d0e81af82901854341da9000412ab480baf28b3461a89c87559400790cba9fa3"; #v 1.16.0
    ports = ["8282:80"];
    volumes = [
      "/home/notoh/docker/wallos/db:/var/www/html/db"
      "/home/notoh/docker/wallos/logos:/var/www/html/images/uploads/logos"
    ];
    environment = {TZ = "America/New_York";};
  };
}
