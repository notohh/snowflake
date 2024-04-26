_: {
  programs.helix = {
    themes.tokyonight = let
      red = "#f7768e";
      orange = "#ff9e64";
      yellow = "#e0af68";
      light-green = "#9ece6a";
      green = "#73daca";
      turquoise = "#89ddff";
      teal = "#2ac3de";
      cyan = "#7dcfff";
      blue = "#7aa2f7";
      magenta = "#bb9af7";
      white = "#c0caf5";
      light-gray = "#9aa5ce";
      comment = "#565f89";
      black = "#414868";
      foreground = "#a9b1d6";
      foreground_gutter = "#363b54";
      background_highlight = "#30374b";
      background_menu = "#16161e";
    in {
      "comment" = {
        fg = comment;
        modifiers = ["italic"];
      };
      "constant" = {fg = orange;};
      "constant.character.escape" = {fg = magenta;};
      "function" = {
        fg = blue;
        modifiers = ["italic"];
      };
      "function.macro" = {fg = cyan;};
      "keyword" = {
        fg = cyan;
        modifiers = ["italic"];
      };
      "keyword.control" = {fg = magenta;};
      "keyword.control.import" = {fg = cyan;};
      "keyword.operator" = {fg = turquoise;};
      "keyword.function" = {
        fg = magenta;
        modifiers = ["italic"];
      };
      "operator" = {fg = turquoise;};
      "punctuation" = {fg = turquoise;};
      "string" = {fg = light-green;};
      "string.regexp" = {fg = "light-blue";};
      "tag" = {fg = red;};
      "type" = {fg = teal;};
      "namespace" = {fg = blue;};
      "variable" = {fg = white;};
      "variable.builtin" = {fg = red;};
      "variable.other.member" = {fg = green;};
      "variable.parameter" = {
        fg = yellow;
        modifiers = ["italic"];
      };

      "diff.plus" = {fg = green;};
      "diff.delta" = {fg = orange;};
      "diff.minus" = {fg = red;};

      "ui.background" = {fg = foreground;};

      "ui.cursor" = {modifiers = ["reversed"];};
      "ui.cursor.match" = {
        fg = orange;
        modifiers = ["bold"];
      };
      "ui.cursor.primary" = {modifiers = ["reversed"];};
      "ui.cursorline.primary" = {bg = background_menu;};
      "ui.help" = {
        fg = foreground;
        bg = background_menu;
      };
      "ui.linenr" = {fg = foreground_gutter;};
      "ui.linenr.selected" = {fg = foreground;};
      "ui.menu" = {
        fg = foreground;
        bg = background_menu;
      };
      "ui.menu.selected" = {bg = background_highlight;};
      "ui.popup" = {
        fg = foreground;
        bg = background_menu;
      };
      "ui.selection" = {bg = background_highlight;};
      "ui.selection.primary" = {bg = background_highlight;};
      "ui.statusline" = {
        fg = foreground;
        bg = background_menu;
      };
      "ui.statusline.inactive" = {
        fg = foreground_gutter;
        bg = background_menu;
      };
      "ui.statusline.normal" = {
        fg = black;
        bg = blue;
      };
      "ui.statusline.insert" = {
        fg = black;
        bg = green;
      };
      "ui.statusline.select" = {
        fg = black;
        bg = magenta;
      };
      "ui.text" = {fg = foreground;};
      "ui.text.focus" = {fg = cyan;};
      "ui.virtual.ruler" = {bg = foreground_gutter;};
      "ui.virtual.whitespace" = {fg = foreground_gutter;};
      "ui.virtual.inlay-hint" = {fg = comment;};
      "ui.window" = {fg = black;};

      "error" = {fg = red;};
      "warning" = {fg = yellow;};
      "info" = {fg = blue;};
      "hint" = {fg = teal;};
      "diagnostic.error" = {
        underline = {
          style = "curl";
          color = red;
        };
      };
      "diagnostic.warning" = {
        underline = {
          style = "curl";
          color = yellow;
        };
      };
      "diagnostic.info" = {
        underline = {
          style = "curl";
          color = blue;
        };
      };
      "diagnostic.hint" = {
        underline = {
          style = "curl";
          color = teal;
        };
      };
      "special" = {fg = orange;};

      "markup.heading" = {
        fg = cyan;
        modifiers = ["bold"];
      };
      "markup.list" = {fg = cyan;};
      "markup.bold" = {
        fg = orange;
        modifiers = ["bold"];
      };
      "markup.italic" = {
        fg = yellow;
        modifiers = ["italic"];
      };
      "markup.strikethrough" = {modifiers = ["crossed_out"];};
      "markup.link.url" = {fg = green;};
      "markup.link.text" = {fg = light-gray;};
      "markup.quote" = {
        fg = yellow;
        modifiers = ["italic"];
      };
      "markup.raw" = {fg = cyan;};
    };
  };
}