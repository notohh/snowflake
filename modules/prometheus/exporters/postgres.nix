_: {
  services.prometheus.exporters.postgres = {
    enable = true;
    openFirewall = true;
    port = 9003;
  };
}