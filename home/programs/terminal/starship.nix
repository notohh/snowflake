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
      command_timeout = 2000;
      add_newline = false;
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
        "$direnv"
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
        format = "[$hostname $ssh_symbol]($style)";
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
      direnv = {
        disabled = false;
        detect_files = [".envrc"];
        style = "bold turquoise";
      };
      git_branch = {
        symbol = "";
        format = "[$symbol $branch ]($style)";
        style = "turquoise";
      };
      git_status = {
        format = "[$all_status$ahead_behind ]($style)";
        style = "red";
      };
      golang = {
        symbol = "";
        format = "[$symbol ($version) ]($style)";
        style = "teal";
      };
      rust = {
        symbol = "";
        format = "[$symbol ($version) ]($style)";
        style = "orange";
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
