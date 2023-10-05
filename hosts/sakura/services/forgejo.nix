{
  lib,
  config,
  ...
}: {
  sops.secrets.forgejo-runner-token = {owner = "forgejo";};
  services.forgejo = {
    enable = true;
    stateDir = "/var/lib/forgejo";
    settings = {
      service.DISABLE_REGISTRATION = true;
      DEFAULT.APP_NAME = "forgejo";
      ui = {
        DEFAULT_THEME = "forgejo-dark";
      };
      actions = {
        ENABLED = true;
        DEFAULT_ACTIONS_URL = "https://code.forgejo.org";
      };
      server = {
        HTTP_PORT = 3200;
        DOMAIN = "git.notohh.dev";
        ROOT_URL = "https://git.flake.sh";
        LANDING_PAGE = "/explore/repos";
      };
      database = {
        DB_TYPE = lib.mkForce "postgres";
        HOST = "192.168.1.211:5432";
        NAME = "forgejo";
        USER = "forgejo";
        PASSWD = "forgejo";
      };
      metrics = {
        ENABLED = true;
        ENABLED_ISSUE_BY_REPOSITORY = true;
        ENABLED_ISSUE_BY_LABEL = true;
      };
    };
  };
  services.gitea-actions-runner.instances.main = {
    enable = true;
    name = config.networking.hostName;
    url = "https://git.flake.sh";
    token = config.sops.secrets.forgejo-runner-token.path;
    labels = [
      "debian-latest:docker://node:18-bullseye"
      "ubuntu-latest:docker://node:18-bullseye"
      #"native:host"
    ];
  };
}
