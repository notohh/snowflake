_: {
  networking.firewall.allowedTCPPorts = [8385];
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    dataDir = "/home/notoh/sync";
    configDir = "/home/notoh/.config/syncthing";
    guiAddress = "192.168.1.54:8385";
    user = "notoh";
    group = "users";
  };
}
