_: {
  programs.lazygit = {
    enable = true;
    settings = {
      windowSize = "normal";
      gui.theme = {
        lightTheme = false;
        activeBorderColor = ["#a6e3a1" "bold"];
        inactiveBorderColor = ["#cdd6f4"];
        optionsTextColor = ["#89b4fa"];
        selectedLineBgColor = ["#313244"];
        selectedRangeByColor = ["#313244"];
        cherryPickedCommitBgColor = ["#94e2d5"];
        cherryPickedCommitFgColor = ["#89b4fa"];
        unstagedChangesColor = ["red"];
      };
      services = {
        "git.notohh.dev" = "gitea:git.notohh.dev";
      };
    };
  };
}
