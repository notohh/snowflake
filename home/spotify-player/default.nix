{pkgs, ...}: {
  home.packages = [pkgs.spotify-player];
  xdg.configFile."spotify-player/app.toml" = {
    text = ''
      theme = "default"
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
      cover_img_length = 10
      cover_img_scale = 1.5
      playback_window_width = 6

      [device]
      name = "tsuki"
      device_type = "computer"
      volume = 100
      bitrate = 320
      audio_cache = true
    '';
  };
}
