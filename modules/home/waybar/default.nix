{
  default,
  config,
  ...
}:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        output = "DP-3";
        layer = "top";
        position = "top";
        height = 35;
        width = 1879;
        spacing = 10;
        margin-top = 8;
        modules-left = [
         "image/nixos"
         "user"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "pulseaudio"
          "cpu"
          "memory"
          "clock"
          "tray"
          "custom/wlogout"
        ];
        "image/nixos" ={
          path = "/home/notoh/Pictures/icons/nixos.png";
          size = 24;
        };
        "user" ={
          format = "{user} (up {work_H} hrs, {work_d} days ↑)";
          interval = 60;
          icon = false;
        };
        "hyprland/window" = {
          format = " {}";
          seperate-outputs = true;
          max-length = 35;
        };
        "pulseaudio" = {
          format = "{volume}% {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" "" ""];
          };
        };
        "cpu" = {
          format = "{usage}% ";
          tooltip = "false";
        };
        "memory" = {
          format = "{}% ";
        };
        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };
        "tray" = {
          spacing = 0;
        };
        "custom/wlogout" = {
          format = "";
          interval = "once";
          on-click = "wlogout -c 5 -r 5";
          tooltip = "false";
        };
      };
    };
    style = ''
* {
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: FontAwesome, JetBrainsMono Nerd Font, JetBrains Mono, Helvetica, Arial, sans-serif;
    font-size: 14px;
    border-radius: 6px;
    padding-bottom: 3px;
    padding-right: 7px;
    padding-left: 7px;
    padding-top: 3px;
    min-height: 0px;
  }

window#waybar {
    background-color: rgb(30, 30, 46);
    border-radius: 21px;
    border-bottom: 3px solid rgb(245, 194, 231);
    border-left: 3px solid rgb(245, 194, 231);
    border-right: 3px solid rgb(245, 194, 231);
    border-top: 3px solid rgb(245, 194, 231);
    color: #ffffff;
    transition-property: background-color;
    transition-duration: .5s;
}

window#waybar.hidden {
    opacity: 0.2;
}

/*
window#waybar.empty {
    background-color: transparent;
}
window#waybar.solo {
    background-color: #FFFFFF;
}
*/

window#waybar.termite {
    background-color: #3F3F3F;
}

window#waybar.chromium {
    background-color: #000000;
    border: none;
}

button {
    /* Use box-shadow instead of border so the text isn't offset */
    box-shadow: inset 0 -3px transparent;
    /* Avoid rounded borders under each button name */
    border: none;
    border-radius: 0;
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
button:hover {
    background: inherit;
    box-shadow: inset 0 -3px #ffffff;
}

#workspaces button {
    padding: 0 5px;
    background-color: transparent;
    color: #ffffff;
}

#workspaces button:hover {
    background: rgba(0, 0, 0, 0.2);
}

#workspaces button.focused {
    background-color: #64727D;
    box-shadow: inset 0 -3px #ffffff;
}

#workspaces button.urgent {
    background-color: #eb4d4b;
}

#mode {
    background-color: #64727D;
    border-bottom: 3px solid #ffffff;
}

#clock,
#battery,
#cpu,
#memory,
#disk,
#temperature,
#network,
#pulseaudio,
#wireplumber,
#custom-media,
#tray,
#mode {
    padding: 0 5px;
    color: #ffffff;

}

#window,
#workspaces {
    margin: 0 4px;
}

/* If workspaces is the leftmost module, omit left margin */
.modules-left > widget:first-child > #workspaces {
    margin-left: 0;
}

/* If workspaces is the rightmost module, omit right margin */
.modules-right > widget:last-child > #workspaces {
    margin-right: 0;
}

#clock {
    background-color: #cba6f7;
    color: black;
}

label:focus {
    background-color: #000000;
}

#cpu {
    background-color: #eba0ac;
    color: #000000;
}

#memory {
    background-color: #f38ba8;
    color: black;
}

#disk {
    background-color: #964B00;
}

#network {
    background-color: #2980b9;
}

#network.disconnected {
    background-color: #f53c3c;
}

#pulseaudio {
    background-color: #f9e2af;
    color: #000000;
}

#pulseaudio.muted {
    background-color: #90b1b1;
    color: #2a5c45;
}

#wireplumber {
    background-color: #fff0f5;
    color: #000000;
}

#wireplumber.muted {
    background-color: #f53c3c;
}

#custom-media {
    background-color: #66cc99;
    color: #2a5c45;
    min-width: 100px;
}

#custom-media.custom-spotify {
    background-color: #66cc99;
}

#custom-media.custom-vlc {
    background-color: #ffa000;
}

#temperature {
    background-color: #fab387;
    color: black;
}

#temperature.critical {
    background-color: #eb4d4b;
}

#tray {
    background-color: transparent;
}

#tray > .passive {
    -gtk-icon-effect: dim;
}

#tray > .needs-attention {
    -gtk-icon-effect: highlight;
    background-color: #eb4d4b;
}

#language {
    background: #00b093;
    color: #740864;
    padding: 0 5px;
    margin: 0 5px;
    min-width: 16px;
}

#window {
    background: #f5c2e7;
    color: black;
    padding-left: 10px;
    padding-right: 10px;
}

#user {
    background: #f5c2e7;
    color: black;
    padding-left: 10px;
    padding-right: 10px;
}

#custom-wlogout {
  font-size: 15px;
}

  '';
  };
}