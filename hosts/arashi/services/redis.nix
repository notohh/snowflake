_: {
  services.redis.servers.default = {
    enable = true;
    openFirewall = true;
    port = 6379;
  };
}
