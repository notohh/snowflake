_: {
  programs = {
    delta = {
      enable = true;
      enableGitIntegration = true;
    };
    git = {
      enable = true;
      settings = {
        user.email = "github@notohh.dev";
        user.name = "notohh";
      };
      signing = {
        key = "BD47506D475EE86D";
        signByDefault = true;
      };
      ignores = [
        "*result*"
        ".direnv"
        "node_modules"
      ];
    };
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      settings = {
        git_protocol = "ssh";
        editor = "hx";
        prompt = "enabled";
      };
    };
  };
}
