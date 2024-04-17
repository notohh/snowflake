_: {
  programs.lazygit = {
    enable = true;
    settings = {
      windowSize = "normal";
      gui.theme = {
        lightTheme = false;
        activeBorderColor = ["#2ac3de" "bold"];
        inactiveBorderColor = ["#f7768e"];
        optionsTextColor = [" #c0caf5"];
        selectedLineBgColor = ["#24283b"];
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
