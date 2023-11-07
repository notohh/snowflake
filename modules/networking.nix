_: {
  networking = {
    networkmanager.enable = true;
    nameservers = ["192.168.1.221"];
    firewall = {
      enable = true;
    };
  };
  environment.etc = {
    "resolv.conf".text = ''
      nameserver 192.168.1.221
      nameserver 192.168.1.153
    '';
  };

  services.tailscale.enable = true;
}
