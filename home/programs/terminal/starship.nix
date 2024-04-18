{
  config,
  lib,
  ...
}: {
  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";

  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    settings = {
      palette = "tokyonight";
      add_newline = false;
      palettes.tokyonight = {
        red = "#f7768e";
        orange = "#ff9e64";
        yellow = "#e0af68";
        light-green = "#9ece6a";
        green = "#73daca";
        turquoise = "#89ddff";
        light-cyan = "#b4f9f8";
        teal = "#2ac3de";
        cyan = "#7dcfff";
        blue = "#7aa2f7";
        magenta = "#bb9af7";
        white = "#c0caf5";
        light-gray = "#9aa5ce";
        parameters = "#cfc9c2";
        comment = "#565f89";
        black = "#414868";
        foreground = "#a9b1d6";
        background = "#1a1b26";
      };
      format = lib.concatStrings [
        "$character"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_status"
        "$rust"
        "$golang"
      ];
      right_format = lib.concatStrings [
        "$nix_shell"
      ];
      character = {
        error_symbol = "[](bold red)";
        success_symbol = "[](bold white)";
      };
      username = {
        show_always = false;
        format = "[$user]($style)";
        style_user = "red";
      };
      hostname = {
        ssh_symbol = "🌐";
        format = "[on $hostname $ssh_symbol]($style)";
        ssh_only = true;
        disabled = false;
      };
      directory = {
        format = "[$path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        read_only = "🔒";
        style = "red";
        home_symbol = "";
      };
      directory.substitutions = {
        "Documents" = " ";
        "Downloads" = " ";
        "Music" = " ";
        "Pictures" = " ";
      };
      nix_shell = {
        disabled = false;
        impure_msg = "[impure shell](bold red)";
        pure_msg = "[pure shell](bold green)";
        unknown_msg = "[unknown shell](bold yellow)";
        format = "[$state( \($name\))](bold white)";
      };
      git_branch = {
        symbol = "";
        format = "[$symbol $branch ]($style)";
        style = "white";
      };
      git_status = {
        format = "[$all_status$ahead_behind ]($style)";
        style = "red";
      };
      golang = {
        symbol = " ";
        format = "[$symbol ($version) ]($style)";
      };
      rust = {
        symbol = "";
        format = "[$symbol ($version) ]($style)";
      };
      time = {
        disabled = false;
        time_format = "%R";
        format = "[ $time ]($style)";
        style = "red";
      };
    };
  };
}
