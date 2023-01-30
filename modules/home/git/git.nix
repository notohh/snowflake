{pkgs, ...}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;
    userEmail = "github@notohh.dev";
    userName = "notohh";
  signing = {
    key = "";
    signByDefault = false;
   };
  ignores = ["*result*" ".direnv" "node_modules"];
};

}