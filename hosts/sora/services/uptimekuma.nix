_: {
  networking.firewall.allowedTCPPorts = [4000];
  services.uptime-kuma = {
    enable = true;
    settings = {
      HOST = "100.104.42.96";
      PORT = "4000";
    };
  };
}
