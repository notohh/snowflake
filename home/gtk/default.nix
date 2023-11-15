{pkgs, ...}: {
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    font = {
      name = "jost";
      package = pkgs.jost;
    };
    theme = {
      name = "Tokyonight-Dark-BL";
      package = pkgs.tokyo-night-gtk;
    };
  };
}
