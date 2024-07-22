_: {
  virtualisation.oci-containers.containers.wallos = {
    image = "bellamy/wallos@sha256:986f8ee1a780bd7f0069b71c52f698fd42ee202c3e33b61be336d4fd1194099d"; #v 2.19.3
    ports = ["8282:80"];
    volumes = [
      "/home/notoh/docker/wallos/db:/var/www/html/db"
      "/home/notoh/docker/wallos/logos:/var/www/html/images/uploads/logos"
    ];
    environment = {TZ = "America/New_York";};
  };
}
