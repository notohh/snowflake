_: {
  programs.zed-editor.userSettings = {
    ui_font_size = 16;
    ui_font_family = "Maple Mono NF";
    buffer_font_size = 16;
    buffer_font_family = "Maple Mono NF";
    relative_line_numbers = true;
    hour_format = "hour24";
    shell = "nu";
    theme = {
      dark = "Catppuccin Mocha (pink)";
      light = "Catppuccin Mocha (pink)";
    };
    tabs = {
      file_icons = true;
      git_status = true;
    };
    indent_guides = {
      enable = true;
    };
    inlay_hints = {
      enable = true;
    };
    telemetry = {
      diagnostics = false;
      metrics = false;
    };
    assistant = {
      default_model = {
        provider = "copilot_chat";
        model = "gpt-4o";
      };
      version = "2";
    };
    diagnostics = {
      inline = {
        enabled = true;
        update_debounce_ms = 150;
        padding = 4;
        max_severity = null;
      };
    };
    languages = {
      Nix = {
        language_servers = ["nil"];
        formatter = {
          external = {
            command = "alejandra";
            arguments = ["--quiet" "--"];
          };
        };
      };
      lsp = {
        discord_presence = {
          initialization_options = {
            git_integration = false;
            rules = {
              mode = "blacklist";
              paths = ["/home/notoh/dev/ec" "/home/notoh/dev/yamilol"];
            };
          };
        };
      };
    };
  };
}
