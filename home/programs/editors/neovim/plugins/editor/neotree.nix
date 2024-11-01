_: {
  programs.nixvim.plugins.neo-tree = {
    enable = true;
    enableDiagnostics = true;
    extraOptions = {
      filesystem = {
        filtered_items = {
          visible = true;
          hide_fotfiles = false;
        };
      };
    };
  };
}
