_: {
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    dataDir = "/home/notoh/sync";
    configDir = "/home/notoh/.config/syncthing";
    guiAddress = "100.121.201.47:8384";
    user = "notoh";
    group = "users";
  };
}
