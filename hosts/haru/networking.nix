_: {
  networking = {
    networkmanager.enable = true;
    nameservers = ["1.1.1.1"];
    firewall = {
      enable = true;
    };
  };
  environment.etc = {
    "resolv.conf".text = ''
      nameserver 1.1.1.1
      nameserver 1.0.0.1
    '';
  };
}
