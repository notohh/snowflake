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
    theme = {
      name = "Catppuccin-Mocha-Standard-Red-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["red"];
        size = "standard";
        variant = "mocha";
      };
    };
  };
}
