_: {
  virtualisation.oci-containers.containers.wallos = {
    image = "bellamy/wallos:latest";
    ports = [
      "8282:80"
    ];
    volumes = [
      "/home/notoh/docker/wallos/db:/var/www/html/db"
      "/home/notoh/docker/wallos/logos:/var/www/html/images/uploads/logos"
    ];
    environment = {
      TZ = "America/New_York";
    };
  };
}
