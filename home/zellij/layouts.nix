{...}: {
  home.file.".config/zellij/snowflake.kdl".text = ''
      layout {
        tab name="main" {
            pane size=1 borderless=true {
              plugin location="zellij:tab-bar"
            }
            pane split_direction="vertical" {
              pane size="110"
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

  home.file.".config/zellij/ssh.kdl".text = ''
      layout {
        tab name="ssh" {
            pane size=1 borderless=true {
              plugin location="zellij:tab-bar"
            }
            pane split_direction="vertical" {
              pane
              pane split_direction="horizontal" {
                pane command="ssh" {
                  args "oh@100.117.178.88"
                }
                pane command="ssh" {
                  args "oh@100.103.228.56"
                }
            }
        }
            pane size=2 borderless=true {
              plugin location="zellij:status-bar"
            }
        }
    }

  '';
}
