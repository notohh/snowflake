{pkgs, ...}: {
  environment.systemPackages = [pkgs.redis-dump];
  services.redis.servers = {
    forgejo = {
      enable = true;
      openFirewall = true;
      port = 6379;
      bind = null;
      databases = 16;
      logLevel = "debug";
      requirePass = "forgejo";
      settings = {
        protected-mode = "no";
      };
    };
  };
}
