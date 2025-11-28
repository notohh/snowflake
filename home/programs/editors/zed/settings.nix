{ pkgs, lib, ... }:
{
  programs.zed-editor.userSettings = {
    ui_font_size = 16;
    ui_font_family = "Maple Mono NF";
    buffer_font_size = 16;
    buffer_font_family = "Maple Mono NF";
    relative_line_numbers = "enabled";
    hour_format = "hour24";
    load_direnv = "shell_hook";
    theme = {
      dark = "One Dark Pro Night Flat";
      light = "One Dark Pro Night Flat";
    };
    icon_theme = "Material Icon Theme";
    tabs = {
      file_icons = true;
      git_status = true;
    };
    indent_guides = {
      enabled = true;
    };
    inlay_hints = {
      enabled = true;
    };
    telemetry = {
      diagnostics = false;
      metrics = false;
    };
    agent = {
      default_model = {
        provider = "copilot_chat";
        model = "gpt-4o";
      };
    };
    terminal = {
      shell = "system";
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
        language_servers = [
          "nil"
          "discord_presence"
        ];
        formatter = {
          external = {
            command = "${lib.getExe pkgs.nixfmt}";
            arguments = [
              "-q"
            ];
          };
        };
      };
      lsp = {
        discord_presence = {
          initialization_options = {
            git_integration = true;
          };
        };
      };
    };
  };
}
