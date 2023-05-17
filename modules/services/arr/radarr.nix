{...}: {
  services.radarr = {
    enable = true;
    openFirewall = true;
    dataDir = "/home/notoh/radarr";
  };
}
