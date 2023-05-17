{...}: {
  services.sonarr = {
    enable = true;
    openFirewall = true;
    dataDir = "/home/notoh/sonarr";
  };
}
