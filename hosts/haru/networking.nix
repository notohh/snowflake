_: {
  networking = {
    networkmanager.enable = true;
    hostName = "haru";
    firewall = {
      enable = true;
    };
  };
  environment.etc = {
    "resolv.conf".text = ''
      nameserver 192.168.1.103
      nameserver 9.9.9.9
    '';
  };
}
