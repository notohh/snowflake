{lib, ...}: {
  networking.firewall.allowedTCPPorts = [2222];
  services.forgejo = {
    enable = true;
    stateDir = "/var/lib/forgejo";
    settings = {
      service.DISABLE_REGISTRATION = true;
      DEFAULT.APP_NAME = "forgejo";
      log.LEVEL = "Debug";
      ui = {
        DEFAULT_THEME = "forgejo-dark";
      };
      actions = {
        ENABLED = true;
        DEFAULT_ACTIONS_URL = "https://code.forgejo.org";
      };
      server = {
        HTTP_PORT = 3200;
        DOMAIN = "git.flake.sh";
        ROOT_URL = "https://git.flake.sh";
        LANDING_PAGE = "/explore/repos";
        START_SSH_SERVER = true;
        SSH_DOMAIN = "git.flake.sh";
        SSH_PORT = 2222;
        SSH_LISTEN_PORT = 2222;
        SSH_LISTEN_HOST = "100.121.201.47";
      };
      database = {
        DB_TYPE = lib.mkForce "postgres";
        HOST = "192.168.1.211:5432";
        NAME = "forgejo";
        USER = "forgejo";
        PASSWD = "forgejo";
      };
      cache = {
        ENABLED = true;
        ADAPTER = lib.mkForce "redis";
        HOST = "redis://:forgejo@100.94.214.100:6379";
      };
      metrics = {
        ENABLED = true;
        ENABLED_ISSUE_BY_REPOSITORY = true;
        ENABLED_ISSUE_BY_LABEL = true;
      };
    };
  };
}
