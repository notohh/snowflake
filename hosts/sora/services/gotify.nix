_: {
  networking.firewall.allowedTCPPorts = [3000];
  services.gotify = {
    enable = true;
    port = 3000;
  };
}
