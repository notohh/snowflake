_: {
  virtualisation.oci-containers.containers.wallos = {
    image = "bellamy/wallos@sha256:18f77ed070788052fb7fb2417a398f96cdd1dbb1ac7c2907531544082090bd66"; #v 1.6.0
    ports = ["8282:80"];
    volumes = [
      "/home/notoh/docker/wallos/db:/var/www/html/db"
      "/home/notoh/docker/wallos/logos:/var/www/html/images/uploads/logos"
    ];
    environment = {TZ = "America/New_York";};
  };
}
