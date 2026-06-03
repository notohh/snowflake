_: {
  networking = {
    resolvconf = {
      enable = true;
      extraOptions = [
        "nameserver 192.168.1.103"
        "nameserver 1.1.1.1"
      ];
    };
    networkmanager.enable = true;
    hostName = "tsuru";
    firewall = {
      enable = true;
    };
  };
}
