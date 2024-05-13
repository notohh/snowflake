_: {
  virtualisation.oci-containers.containers.wallos = {
    image = "bellamy/wallos@sha256:142d7f1202cc0d80a02e9ae48c1a53de7cf5f448758d853a1fe8f5af732459fd"; #v 1.27.1
    ports = ["8282:80"];
    volumes = [
      "/home/notoh/docker/wallos/db:/var/www/html/db"
      "/home/notoh/docker/wallos/logos:/var/www/html/images/uploads/logos"
    ];
    environment = {TZ = "America/New_York";};
  };
}
