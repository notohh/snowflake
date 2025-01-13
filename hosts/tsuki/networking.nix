_: {
  networking = {
    networkmanager.enable = true;
    hostName = "tsuki";
    firewall = {
      enable = true;
      allowedTCPPorts = [
        7000 # uxplay
        7100 # uxplay
        7001 # uxplay
      ];
      allowedUDPPorts = [
        7011 # uxplay
        6001 # uxplay
        6000 # uxplay
      ];
    };
  };
  environment.etc = {
    "resolv.conf".text = ''
      nameserver 192.168.1.103
      nameserver 9.9.9.9
      options edns0
    '';
  };
}
