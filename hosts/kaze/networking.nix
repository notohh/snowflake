_: {
  networking = {
    networkmanager.enable = true;
    hostName = "kaze";
    firewall = {
      enable = true;
    };
  };
  environment.etc = {
    "resolv.conf".text = ''
      nameserver 9.9.9.9
      nameserver 149.112.112.112
    '';
  };
}
