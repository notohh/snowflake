_: {
  virtualisation.oci-containers.containers.wallos = {
    image = "bellamy/wallos";
    ports = [
      "8282:80"
    ];
    volumes = [
      "/home/notohh/docker/wallos/db:/var/www/html/db"
      "/home/notohh/docker/wallos/logos:/var/www/html/images/uploads/logos"
    ];
    environment = {
      TZ = "America/New_York";
    };
  };
}
