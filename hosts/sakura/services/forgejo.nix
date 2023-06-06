{pkgs, ...}: {
  services.gitea = {
    enable = true;
    package = pkgs.forgejo;
    appName = "forgejo";
    stateDir = "/sakura/forgejo";
    settings = {
      actions = {
        ENABLED = true;
        DEFAULT_ACTIONS_URL = "https://gitea.com";
      };
      service.DISABLE_REGISTRATION = true;
      server = {
        HTTP_PORT = 3000;
        DOMAIN = "git.notohh.dev";
        ROOT_URL = "https://git.notohh.dev";
        LANDING_PAGE = "/explore/repos";
      };
    };
  };
}
