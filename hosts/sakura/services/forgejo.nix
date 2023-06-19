{
  pkgs,
  config,
  lib,
  ...
}: {
  services.gitea = {
    enable = true;
    package = pkgs.forgejo;
    appName = "forgejo";
    stateDir = "/var/lib/forgejo";
    settings = {
      service.DISABLE_REGISTRATION = false;
      ui = {
        DEFAULT_THEME = "forgejo-dark";
      };
      actions = {
        ENABLED = true;
        DEFAULT_ACTIONS_URL = "https://gitea.com";
      };
      server = {
        HTTP_PORT = 3200;
        DOMAIN = "git.notohh.dev";
        ROOT_URL = "https://git.notohh.dev";
        LANDING_PAGE = "/explore/repos";
      };
      database = {
        DB_TYPE = lib.mkForce "postgres";
        HOST = "192.168.1.211:5432";
        NAME = "forgejo";
        USER = "forgejo";
        PASSWD = "forgejo";
      };
    };
  };
}
