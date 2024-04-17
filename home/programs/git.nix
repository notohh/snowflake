{pkgs, ...}: {
  programs = {
    git = {
      enable = true;
      delta.enable = true;
      userEmail = "github@notohh.dev";
      userName = "notohh";
      signing = {
        key = "BD47506D475EE86D";
        signByDefault = true;
      };
      ignores = ["*result*" ".direnv" "node_modules"];
    };
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      settings = {
        editor = "hx";
        prompt = "enabled";
      };
    };
  };
}
