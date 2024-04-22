_: {
  programs.ironbar.config = let
    nixlogo = rec {
      type = "custom";
      name = "nixlogo";
      class = name;
      bar = [
        {
          type = "image";
          src = "https://files.artturin.com/files/nixoscolorful.svg";
          size = 24;
        }
      ];
    };
    tray = {type = "tray";};
    clock = {type = "clock";};
  in {
    monitors = {
      "DP-2" = {
        position = "top";
        anchor_to_edges = true;
        start = [nixlogo];
        center = [];
        end = [clock tray];
      };
    };
  };
}
