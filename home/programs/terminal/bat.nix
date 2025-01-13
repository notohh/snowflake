_: {
  programs.bat = {
    enable = true;
    config = {
      pager = "--RAW-CONTROL-CHARS --quit-if-one-screen --mouse";
      style = "plain";
    };
  };
}
