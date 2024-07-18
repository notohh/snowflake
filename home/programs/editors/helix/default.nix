_: {
  imports = [
    ./languages.nix
    ./themes/tokyonight.nix
    ./themes/onedark.nix
    ./themes/catppuccin_mocha.nix
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "onedark";
      editor = {
        auto-save = true;
        true-color = true;
        color-modes = true;
        cursorline = true;
        completion-replace = true;
        soft-wrap.enable = true;
        idle-timeout = 1;
        gutters = ["diff" "diagnostics" "line-numbers" "spacer"];
        statusline = {
          left = ["mode" "spinner"];
          center = ["file-name"];
          right = ["diagnostics" "selections" "position" "file-line-ending" "file-type" "version-control"];
          separator = "|";
          mode = {
            normal = "NOR";
            insert = "INS";
            select = "SEL";
          };
        };
        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "error";
        };
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides = {
          render = true;
          rainbow = "dim";
          character = "┆";
        };
        whitespace = {
          characters = {
            space = "·";
            nbsp = "⍽";
            tab = "→";
            newline = "⏎";
            tabpad = "·";
          };
        };
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
      };
    };
  };
}
