_: {
  programs.helix = {
    themes.onedark = let
      yellow = "#E5C07B";
      blue = "#61AFEF";
      red = "#E06C75";
      purple = "#C678DD";
      green = "#98C379";
      gold = "#D19A66";
      cyan = "#56B6C2";
      white = "#c0caf5";
      black = "#1a1b26";
      light-black = "#2C323C";
      gray = "#3E4452";
      faint-gray = "#3B4048";
      light-gray = "#5C6370";
      linenr = "#4B5263";
    in {
      "tag" = {fg = red;};
      "attribute" = {fg = yellow;};
      "comment" = {
        fg = light-gray;
        modifiers = ["italic"];
      };
      "constant" = {fg = cyan;};
      "constant.numeric" = {fg = gold;};
      "constant.builtin" = {fg = gold;};
      "constant.character.escape" = {fg = gold;};
      "constructor" = {fg = cyan;};
      "function" = {
        fg = blue;
        modifiers = ["italic"];
      };
      "function.builtin" = {fg = blue;};
      "function.macro" = {fg = purple;};
      "keyword" = {
        fg = red;
        modifiers = ["italic"];
      };
      "keyword.control" = {fg = purple;};
      "keyword.control.import" = {
        fg = red;
        modifiers = ["italic"];
      };
      "keyword.directive" = {fg = purple;};
      "label" = {fg = purple;};
      "namespace" = {fg = blue;};
      "operator" = {fg = purple;};
      "keyword.operator" = {fg = purple;};
      "special" = {fg = blue;};
      "string" = {fg = green;};
      "type" = {fg = yellow;};
      "variable" = {fg = yellow;};
      "variable.builtin" = {fg = blue;};
      "variable.parameter" = {
        fg = red;
        modifiers = ["italic"];
      };
      "variable.other.member" = {fg = red;};

      "markup.heading" = {fg = red;};
      "markup.raw.inline" = {fg = green;};
      "markup.bold" = {
        fg = gold;
        modifiers = ["bold"];
      };
      "markup.italic" = {
        fg = purple;
        modifiers = ["italic"];
      };
      "markup.strikethrough" = {modifiers = ["crossed_out"];};
      "markup.list" = {fg = red;};
      "markup.quote" = {fg = yellow;};
      "markup.link.url" = {
        fg = cyan;
        modifiers = ["underlined"];
      };
      "markup.link.text" = {fg = purple;};

      "diff.plus" = green;
      "diff.delta" = gold;
      "diff.minus" = red;

      "diagnostic.info".underline = {
        color = blue;
        style = "curl";
      };
      "diagnostic.hint".underline = {
        color = green;
        style = "curl";
      };
      "diagnostic.warning".underline = {
        color = yellow;
        style = "curl";
      };
      "diagnostic.error".underline = {
        color = red;
        style = "curl";
      };
      "diagnostic.unnecessary" = {modifiers = ["dim"];};
      "diagnostic.deprecated" = {modifiers = ["crossed_out"];};
      "info" = {
        fg = blue;
        modifiers = ["bold"];
      };
      "hint" = {
        fg = green;
        modifiers = ["bold"];
      };
      "warning" = {
        fg = yellow;
        modifiers = ["bold"];
      };
      "error" = {
        fg = red;
        modifiers = ["bold"];
      };

      # "ui.background" = {bg = black;};
      "ui.virtual" = {fg = faint-gray;};
      "ui.virtual.indent-guide" = {fg = faint-gray;};
      "ui.virtual.whitespace" = {fg = light-gray;};
      "ui.virtual.ruler" = {bg = gray;};
      "ui.virtual.inlay-hint" = {fg = light-gray;};
      "ui.virtual.jump-label" = {
        fg = light-gray;
        modifiers = ["bold"];
      };

      "ui.cursor" = {
        fg = white;
        modifiers = ["reversed"];
      };
      "ui.cursor.primary" = {
        fg = white;
        modifiers = ["reversed"];
      };
      "ui.cursor.match" = {
        fg = blue;
        modifiers = ["underlined"];
      };

      "ui.selection" = {bg = faint-gray;};
      "ui.selection.primary" = {bg = gray;};
      # "ui.cursorline.primary" = {bg = light-black;};

      "ui.highlight" = {bg = gray;};
      "ui.highlight.frameline" = {bg = "#97202a";};

      "ui.linenr" = {fg = linenr;};
      "ui.linenr.selected" = {fg = white;};

      "ui.statusline" = {fg = white;};
      "ui.statusline.inactive" = {
        fg = light-gray;
      };
      "ui.statusline.normal" = {
        fg = light-black;
        bg = blue;
        modifiers = ["bold"];
      };
      "ui.statusline.insert" = {
        fg = light-black;
        bg = green;
        modifiers = ["bold"];
      };
      "ui.statusline.select" = {
        fg = light-black;
        bg = purple;
        modifiers = ["bold"];
      };

      "ui.bufferline" = {
        fg = light-gray;
        bg = light-black;
      };
      "ui.bufferline.active" = {
        fg = light-black;
        bg = blue;
        underline = {
          color = light-black;
          style = "line";
        };
      };
      # "ui.bufferline.background" = {bg = light-black;};

      "ui.text" = {fg = white;};
      "ui.text.focus" = {
        fg = white;
        #    bg = light-black;
        modifiers = ["bold"];
      };

      "ui.help" = {
        fg = white;
        # bg = gray;
      };
      # "ui.popup" = {bg = gray;};
      # "ui.window" = {fg = gray;};
      "ui.menu" = {
        fg = white;
        # bg = gray;
      };
      "ui.menu.selected" = {
        fg = black;
        bg = blue;
      };
      "ui.menu.scroll" = {
        fg = white;
        bg = light-gray;
      };

      "ui.debug" = {fg = red;};
    };
  };
}
