{pkgs, ...}: {
  home.packages = [pkgs.spotify-player];
  xdg.configFile."spotify-player/app.toml" = {
    text = ''
      theme = "tokyonight"
      client_id = "bc629e700c1740a28b3f594ef1942eac"
      client_port = 8080
      playack_format = "{track} • {artists}\n{album}\n{metadata}"
      notify_format = { summary = "{track} • {artists}", body = "{album}" }
      copy_command = { command = "wl-copy", args = [] }
      app_refresh_duration_in_ms = 32
      playback_refresh_duration_in_ms = 0
      cover_image_refresh_duration_in_ms = 2000
      page_size_in_rows = 20
      track_table_item_max_len = 32
      enable_media_control = true
      enable_streaming = true
      enable_cover_image_cache = true
      default_device = "tsuki"
      play_icon = "▶"
      pause_icon = "▌▌"
      liked_icon = "♥"
      playback_window_position = "Top"
      cover_img_width = 5
      cover_img_length = 11
      cover_img_scale = 1.6
      playback_window_width = 6

      [device]
      name = "tsuki"
      device_type = "computer"
      volume = 100
      bitrate = 320
      audio_cache = true
      normalization = false
    '';
  };
  xdg.configFile."spotify-player/theme.toml" = {
    text = ''
      [[themes]]
      name = "tokyonight"
      [themes.palette]
      foreground = "#c0caf5"
      black = "#414868"
      red = "#f7768e"
      green = "#9ece6a"
      yellow = "#e0af68"
      blue = "#2ac3de"
      magenta = "#bb9af7"
      cyan = "#7dcfff"
      white = "#eee8d5"
      bright_black = "#24283b"
      bright_red = "#ff4499"
      bright_green = "#73daca"
      bright_yellow = "#657b83"
      bright_blue = "#839496"
      bright_magenta = "#ff007c"
      bright_cyan = "#93a1a1"
      bright_white = "#fdf6e3"
      [themes.component_style]
      block_title = { fg = "Magenta"  }
      border = {}
      playback_track = { fg = "Cyan", modifiers = ["Bold"] }
      playback_artists = { fg = "Cyan", modifiers = ["Bold"] }
      playback_album = { fg = "Yellow" }
      playback_metadata = { fg = "White" }
      playback_progress_bar = { bg = "BrightBlack", fg = "Green" }
      current_playing = { fg = "Green", modifiers = ["Bold"] }
      page_desc = { fg = "Cyan", modifiers = ["Bold"] }
      table_header = { fg = "Blue" }
      selection = { modifiers = ["Bold", "Reversed"] }
    '';
  };
}
