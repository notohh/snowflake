{pkgs, ...}: {
  environment.systemPackages = [pkgs.redis-dump];
  services.redis = {
    package = pkgs.valkey;
    servers = {
      forgejo = {
        enable = true;
        openFirewall = true;
        port = 6379;
        bind = null;
        databases = 1;
        logLevel = "debug";
        requirePass = "forgejo";
        settings = {
          protected-mode = "no";
        };
      };
      vikunja = {
        enable = true;
        openFirewall = true;
        port = 6380;
        bind = null;
        databases = 1;
        logLevel = "debug";
        requirePass = "vikunja";
        settings = {
          protected-mode = "no";
        };
      };
      blocky = {
        enable = true;
        openFirewall = true;
        port = 6381;
        bind = null;
        databases = 1;
        logLevel = "debug";
        requirePass = "blocky";
        settings = {
          protected-mode = "no";
        };
      };
    };
  };
}
