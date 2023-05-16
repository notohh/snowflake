{pkgs, ...}: {
  services.gitea = {
    enable = true;
    package = pkgs.forgejo;
    appName = "forgejo";
    stateDir = "/sakura/forgejo";
    settings = {
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
