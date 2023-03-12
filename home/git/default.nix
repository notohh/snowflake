{
  pkgs,
  ...
}: {
  home.packages = [pkgs.gh];

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

}