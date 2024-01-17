_: {
  services.prometheus.exporters.redis = {
    enable = true;
    openFirewall = true;
    port = 9002;
  };

  services.prometheus.exporters.postgres = {
    enable = true;
    openFirewall = true;
    port = 9003;
  };
}
