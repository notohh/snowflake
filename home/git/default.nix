{pkgs, ...}: {
  programs.git = {
    enable = true;
    userEmail = "github@notohh.dev";
    userName = "notohh";
    signing = {
      key = "BD47506D475EE86D";
      signByDefault = true;
    };
    ignores = ["*result*" ".direnv" "node_modules"];
  };
  programs.gh = {
    enable = true;
    enableGitCredentialHelper = true;
    settings = {
      editor = "hx";
      prompt = "enabled";
    };
  };
}
