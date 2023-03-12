{
  default,
  ...
}: {
  home.file.".config/zellij/mainlayout.kdl".text = ''
  layout {
    tab name="main" {
        pane size=1 borderless=true {
          plugin location="zellij:tab-bar"
        }
        pane split_direction="vertical" {
          pane
          pane split_direction="horizontal" {
            pane
            pane
        }
    }
        pane size=2 borderless=true {
          plugin location="zellij:status-bar"
        }
    }
    tab name="lazygit" {
        pane size=1 borderless=true {
          plugin location="zellij:tab-bar"
        }
        pane command="lazygit"
        pane size=2 borderless=true {
          plugin location="zellij:status-bar"
        }
    }
    tab name="spotify" {
        pane size=1 borderless=true {
          plugin location="zellij:tab-bar"
        }
        pane command="spotify_player"
        pane size=2 borderless=true {
          plugin location="zellij:status-bar"
        }
    }
}

  '';
}
