_: {
  networking.firewall.allowedTCPPorts = [9757];
  networking.firewall.allowedUDPPorts = [9757 5353];
  services.wivrn = {
    enable = false;
    openFirewall = true;
    autoStart = false;
    defaultRuntime = true;
  };
}
