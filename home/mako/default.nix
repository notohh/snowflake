{...}: {
  services.mako = {
    enable = true;
    icons = true;
    maxIconSize = 64;
    maxVisible = 5;
    defaultTimeout = 5000;
    ignoreTimeout = true;
    anchor = "top-right";
    output = "DP-3";
    font = "jost 10";
    padding = "10";
    margin = "18,22,0";
    backgroundColor = "#1e1e2e";
    textColor = "#cdd6f4";
    borderColor = "#f5c2e7";
    progressColor = "over #313244";
  };
}
