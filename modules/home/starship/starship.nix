{config, lib, ...}: {
  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";

  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    settings = {
    format = lib.concatStrings [
    "[░▒▓](#f5c2e7)"
    "$username"
    "$hostname"
    "[](bg:#f38ba8 fg:#f5c2e7)"
    "$directory"
    "[](fg:#f38ba8 bg:#eb7c92)"
    "$git_branch"
    "$git_status"
    "[](fg:#eb7c92 bg:#e6657f)"
    "$c"
    "$golang"
    "$nodejs"
    "$rust"
    "$docker_context" 
    "[](fg:#e6657f bg:#e05a75)"
    "$time"
    "[](fg:#e05a75)"
  ];
  username = {
    show_always = true;
    style_user = "bg:#f5c2e7 fg:#11111b";
    style_root = "bg:#f5c2e7 fg:#11111b";
    format = "[ $user ]($style)";
  };
  hostname = {
    ssh_symbol = "";
    style = "bg:#f5c2e7 fg:#11111b";
    format = "[on $hostname]($style)";
    ssh_only = false;
    disabled = false;
  };
  directory = {
    style = "bg:#f38ba8 fg:#11111b";
    format = "[ $path ]($style)";
    truncation_length = 3;
    truncation_symbol = "…/";
  };
  directory.substitutions = {
    "Documents" = " ";
    "Downloads" = " ";
    "Music" = " ";
    "Pictures" = " ";
  };
  c = {
   symbol = " ";
   style = "bg:#e6657f fg:#11111b";
   format = "[ $symbol ($version) ]($style)";
  };
  docker_context = {
    symbol = " ";
    style = "bg:#e6657f fg:#11111b";
    format = "[ $symbol $context ]($style) $path";
  };
  git_branch = {
    symbol = "";
    style = "bg:#eb7c92 fg:#11111b";
    format = "[ $symbol $branch ]($style)";
  };
  git_status = {
    style = "bg:#eb7c92 fg:#11111b";
    format = "[$all_status$ahead_behind ]($style)";
  };
  golang = {
    symbol = " ";
    style = "bg:#e6657f fg:#11111b";
    format = "[ $symbol ($version) ]($style)";
  };
  nodejs = {
    symbol = "";
    style = "bg:#e6657f fg:#11111b";
    format = "[ $symbol ($version) ]($style)";
  };
  rust = {
    symbol = "";
    style = "bg:#e6657f fg:#11111b";
    format = "[ $symbol ($version) ]($style)";
  };
  time = {
  disabled = false;
  time_format = "%R"; # Hour:Minute Format
  style = "bg:#e05a75 fg:#11111b";
  format = "[ $time ]($style)";
  };

    };
  };
}