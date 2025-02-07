_: {
  programs.zed-editor.userSettings = {
    ui_font_size = 16;
    ui_font_family = "JetBrainsMono Nerd Font";
    buffer_font_size = 16;
    buffer_font_family = "JetBrainsMono Nerd Font";
    relative_line_numbers = true;
    hour_format = "hour24";
    shell = "nu";
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
