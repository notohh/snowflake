_: {
  services.prometheus.exporters.redis = {
    enable = true;
    openFirewall = true;
    port = 9002;
  };
}
