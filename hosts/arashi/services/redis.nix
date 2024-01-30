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
    searxng = {
      enable = true;
      openFirewall = true;
      port = 6380;
      bind = null;
      databases = 16;
      logLevel = "debug";
      requirePass = "searxng";
      settings = {
        protected-mode = "no";
      };
    };
    blocky = {
      enable = true;
      openFirewall = true;
      port = 6381;
      bind = null;
      databases = 16;
      logLevel = "debug";
      requirePass = "blocky";
      settings = {
        protected-mode = "no";
      };
    };
    paperless-ngx = {
      enable = true;
      openFirewall = true;
      port = 6382;
      bind = null;
      databases = 16;
      logLevel = "debug";
      requirePass = "paperless-ngx";
      settings = {
        protected-mode = "no";
      };
    };
  };
}
