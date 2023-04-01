{
  ...
}: {
  programs.lazygit = {
    enable = true;
    settings = {
      windowSize = "normal";
      gui.theme = {
       lightTheme = false;
       activeBorderColor = [ "#a6d189" "bold" ];
       inactiveBorderColor = [ "#c6d0f5" ];
       optionsTextColor = [ "#8caae" ];
       selectedLineBgColor = [ "#414559" ];
       selectedRangeByColor = [ "414559" ];
       cherryPickedCommitBgColor =  [ "81c8be" ];
       cherryPickedCommitFgColor = [ "#8caaee" ];
       unstagedChangesColor = [ "red" ];
      };
    };
  };
}
