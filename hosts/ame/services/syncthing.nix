_: {
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    dataDir = "/home/notoh/sync";
    configDir = "/home/notoh/.config/syncthing";
    guiAddress = "localhost:8384";
    user = "notoh";
    group = "users";
  };
}
