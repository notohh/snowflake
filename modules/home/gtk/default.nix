{
  pkgs,
  config,
  ...
}: {

  home.pointerCursor = {
    package = pkgs.catppuccin-cursors;
    name = "Catppuccin-Mocha-Pink";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

   gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["pink"];
        variant = "mocha";
      };
    };
  };
}