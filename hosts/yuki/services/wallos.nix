_: {
  virtualisation.oci-containers.containers.wallos = {
    image = "bellamy/wallos@sha256:16877ace60e407ca11a5db818de6c67e6ba2fd624c68255ed500f8e9af965f93"; #v 2.0.0
    ports = ["8282:80"];
    volumes = [
      "/home/notoh/docker/wallos/db:/var/www/html/db"
      "/home/notoh/docker/wallos/logos:/var/www/html/images/uploads/logos"
    ];
    environment = {TZ = "America/New_York";};
  };
}
