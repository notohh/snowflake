_: {
  networking.firewall.allowedTCPPorts = [4000];
  services.uptime-kuma = {
    enable = true;
    settings = {
      HOST = "100.87.54.48";
      PORT = "4000";
    };
  };
}
