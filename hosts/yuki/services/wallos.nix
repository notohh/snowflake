_: {
  virtualisation.oci-containers.containers.wallos = {
    image = "bellamy/wallos@sha256:283cef1078cd8d3bf4474c641968328bd3da7c4bb11e92abd0a3a65036b31f47"; #v 1.23.0
    ports = ["8282:80"];
    volumes = [
      "/home/notoh/docker/wallos/db:/var/www/html/db"
      "/home/notoh/docker/wallos/logos:/var/www/html/images/uploads/logos"
    ];
    environment = {TZ = "America/New_York";};
  };
}
