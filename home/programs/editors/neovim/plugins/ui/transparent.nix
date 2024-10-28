_: {
  programs.nixvim.plugins.transparent = {
    enable = true;
    settings = {
      extra_groups = [
        "NeoTreeNormal"
        "NeoTreeNormalNC"
        "NormalFloat"
      ];
    };
  };
}
