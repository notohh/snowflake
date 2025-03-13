_: {
  virtualisation.oci-containers.containers.wallos = {
    image = "bellamy/wallos@sha256:34d1a92083bc4da561607d2b83bf58565754efed714bfe28196b6c3c9ba84031"; #v2.46.1
    ports = ["8282:80"];
    volumes = [
      "/home/notoh/docker/wallos/db:/var/www/html/db"
      "/home/notoh/docker/wallos/logos:/var/www/html/images/uploads/logos"
    ];
    environment = {TZ = "America/New_York";};
  };
}
