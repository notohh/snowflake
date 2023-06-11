_: {
  networking = {
    networkmanager.enable = true;
    nameservers = ["192.168.1.221"];
    firewall = {
      enable = true;
    };
  };
  environment.etc = {
    "resolv.conf".text = "nameserver 192.168.1.221\n";
  };

  services.tailscale = {
    enable = true;
  };
}
