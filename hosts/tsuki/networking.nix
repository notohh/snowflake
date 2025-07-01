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
        5173
        5000 # twitch miner
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
      nameserver 1.1.1.1
      options edns0
    '';
  };
}
