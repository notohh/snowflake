_: {
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    dataDir = "/home/notoh/sync";
    configDir = "/home/notoh/.config/syncthing";
    guiAddress = "100.126.229.95:8386";
    user = "notoh";
    group = "users";
  };
}
