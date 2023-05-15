{pkgs, ...}: {
  services.gitea = {
    enable = true;
    package = pkgs.forgejo;
    stateDir = "/sakura/forjo";
    settings = {
      # service.DISABLE_REGISTRATION = true;
      server = {
        HTTP_PORT = 3000;
        DOMAIN = "git.notohh.dev";
        ROOT_URL = "https://git.notohh.dev";
        LANDING_PAGE = "/explore/repos";
      };
    };
  };
}
