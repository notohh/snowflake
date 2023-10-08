{...}: {
  services.redis.servers = {
    forgejo = {
      enable = true;
      openFirewall = true;
      port = 6379;
      bind = "100.94.214.100";
      databases = 16;
      logLevel = "debug";
      requirePass = "forgejo";
      settings = {
        protected-mode = "no";
      };
    };
  };
}
