{config, pkgs, inputs, ...}: {
  programs.helix = {
  enable = true;
  # langauges = import ./languages.nix args;
  settings = {
    theme = "catppuccin_mocha";
    editor = {
        true-color = true;
        color-modes = true;
        cursorline = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides = {
          render = true;
          rainbow = "dim";
    };
  };
};
};
}