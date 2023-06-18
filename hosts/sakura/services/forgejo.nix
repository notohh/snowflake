{pkgs, ...}: {
  services.gitea = {
    enable = true;
    package = pkgs.forgejo;
    appName = "forgejo";
    stateDir = "/sakura/forgejo";
    settings = {
      service.DISABLE_REGISTRATION = true;
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
    };
  };
}
