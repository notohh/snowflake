_: {
  virtualisation.oci-containers.containers.wallos = {
    image = "bellamy/wallos@sha256:12636976bd9edd52ea1d46f587430b48aa0fe2fed84866052f143ced879c5e72"; #v 2.35.0
    ports = ["8282:80"];
    volumes = [
      "/home/notoh/docker/wallos/db:/var/www/html/db"
      "/home/notoh/docker/wallos/logos:/var/www/html/images/uploads/logos"
    ];
    environment = {TZ = "America/New_York";};
  };
}
