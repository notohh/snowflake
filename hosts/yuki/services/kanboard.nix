{...}: {
  virtualisation.oci-containers.containers.kanboard = {
    image = "kanboard/kanboard";
    ports = [
      "8080:80"
    ];
    volumes = [
      "/var/lib/kanboard/kanboard_data:/var/www/app/data"
      "/var/lib/kanboard/kanboard_plugins:/var/www/app/plugins"
    ];
  };
}
