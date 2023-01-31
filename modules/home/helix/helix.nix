{pkgs, inputs, ...}: {
  programs.helix = {
  enable = true;
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
        
   languages = [
      {
        name = "nix";
        auto-format = true;
      }
      {
        name = "rust";
      }
      {
        name = "go";
      }
      {
        name = "lua";
      }
      {
        name = "python";
      }
      {
        name = "markdown";
      }
      {
        name = "html";
      }
      {
        name = "css";
      }
      {
        name = "yaml";
      }
     ];
    };
   };
  };
 };
}