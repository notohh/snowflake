_: {
  virtualisation.oci-containers.containers.wallos = {
    image = "bellamy/wallos@sha256:9ce55520e7bd3a5518a33f22590b2631b76559faadf1df68e1de4103dc6d60d7"; #v 2.46.0
    ports = ["8282:80"];
    volumes = [
      "/home/notoh/docker/wallos/db:/var/www/html/db"
      "/home/notoh/docker/wallos/logos:/var/www/html/images/uploads/logos"
    ];
    environment = {TZ = "America/New_York";};
  };
}
