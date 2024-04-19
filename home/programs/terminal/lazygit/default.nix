_: {
  programs.lazygit = {
    enable = true;
    settings = {
      windowSize = "normal";
      gui.theme = {
        lightTheme = false;
        activeBorderColor = ["#c0caf5" "bold"];
        inactiveBorderColor = ["#f7768e"];
        optionsTextColor = ["#f7768e"];
        selectedLineBgColor = ["#565f89"];
        selectedRangeByColor = ["#24283b"];
        cherryPickedCommitBgColor = ["#94e2d5"];
        cherryPickedCommitFgColor = ["#89b4fa"];
        unstagedChangesColor = ["red"];
        showRandomTip = false;
        animateExplosion = true;
      };
    };
  };
}
