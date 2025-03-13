source ~/.cache/starship/init.nu

alias zj = zellij
alias zjd = zellij --layout ../.config/zellij/snowflake.kdl
alias lg = lazygit
alias ld = lazydocker
alias ls = eza -l --icons --color always
alias la = eza -alughHo --git --icons --color always
alias calc = eva
alias c = clear
alias f = yazi
alias v = nvim
alias cat = bat
alias rm = rm -i
alias cp = cp -i
alias mv = mv -i
alias grep = rg
alias build = nh os boot .
alias switch = nh os switch .
alias clean = sudo nh clean all
alias deploy = nix run github:serokell/deploy-rs -- --skip-checks --targets
alias dl = yt-dlp -P ~/Videos/downloaded
alias dlad = yt-dlp -x --audio-format mp3 --embed-thumbnail
alias dlcd = yt-dlp
alias up = rpaste -s "https://i.flake.sh/" -e 1day
alias shorten = rpaste -s "https://i.flake.sh/" -e 1day -u
alias send = croc --relay "100.104.42.96:9009" send
alias receive = croc --relay "100.104.42.96:9009"
alias ps = procs
alias ts = tspin
alias generate-topology = nix build ".#topology.x86_64-linux.config.output"

nitch

$env.config = {

  ls: {
    use_ls_colors: true
    clickable_links: true
  }
  rm: {
    always_trash: false
  }
  table: {
    mode: rounded
    index_mode: always
    trim: {
      methodology: wrapping
      wrapping_try_keep_words: true
      truncating_suffix: "..."
    }
  }
  history: {
    max_size: 10000
    sync_on_enter: true
    file_format: "sqlite"
  }
  completions: {
    case_sensitive: false
    quick: true
    partial: true
    algorithm: "prefix"
    external: {
      enable: true
      max_results: 100
      completer: null
    }
  }
  footer_mode: "auto"
  float_precision: 2
  buffer_editor: "hx"
  use_ansi_coloring: true
  edit_mode: vi
  shell_integration: {}
  show_banner: false
  render_right_prompt_on_last_line: false
  hooks: {
    pre_prompt: [{ ||
      null
    }]
    pre_execution: [{ ||
      null
    }]
    env_change: {
      PWD: [{|before, after|
        null
      }]
    }
    display_output: { ||
      if (term size).columns >= 100 { table -e } else { table }
    }
  }

  menus: [
      {
        name: completion_menu
        only_buffer_difference: false
        marker: "| "
        type: {
            layout: columnar
            columns: 4
            col_width: 20
            col_padding: 2
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      {
        name: history_menu
        only_buffer_difference: true
        marker: "? "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      {
        name: help_menu
        only_buffer_difference: true
        marker: "? "
        type: {
            layout: description
            columns: 4
            col_width: 20
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      {
        name: commands_menu
        only_buffer_difference: false
        marker: "# "
        type: {
            layout: columnar
            columns: 4
            col_width: 20
            col_padding: 2
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            $nu.scope.commands
            | where command =~ $buffer
            | each { |it| {value: $it.command description: $it.usage} }
        }
      }
      {
        name: vars_menu
        only_buffer_difference: true
        marker: "# "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            $nu.scope.vars
            | where name =~ $buffer
            | sort-by name
            | each { |it| {value: $it.name description: $it.type} }
        }
      }
      {
        name: commands_with_description
        only_buffer_difference: true
        marker: "# "
        type: {
            layout: description
            columns: 4
            col_width: 20
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            $nu.scope.commands
            | where command =~ $buffer
            | each { |it| {value: $it.command description: $it.usage} }
        }
      }
  ]
  keybindings: [
    {
      name: completion_menu
      modifier: none
      keycode: tab
      mode: vi_normal
      event: {
        until: [
          { send: menu name: completion_menu }
          { send: menunext }
        ]
      }
    }
    {
      name: completion_previous
      modifier: shift
      keycode: backtab
      mode: [emacs, vi_normal, vi_insert]
      event: { send: menuprevious }
    }
    {
      name: history_menu
      modifier: control
      keycode: char_r
      mode: emacs
      event: { send: menu name: history_menu }
    }
    {
      name: next_page
      modifier: control
      keycode: char_x
      mode: emacs
      event: { send: menupagenext }
    }
    {
      name: undo_or_previous_page
      modifier: control
      keycode: char_z
      mode: emacs
      event: {
        until: [
          { send: menupageprevious }
          { edit: undo }
        ]
       }
    }
    {
      name: yank
      modifier: control
      keycode: char_y
      mode: emacs
      event: {
        until: [
          {edit: pastecutbufferafter}
        ]
      }
    }
    {
      name: unix-line-discard
      modifier: control
      keycode: char_u
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          {edit: cutfromlinestart}
        ]
      }
    }
    {
      name: kill-line
      modifier: control
      keycode: char_k
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          {edit: cuttolineend}
        ]
      }
    }
    {
      name: commands_menu
      modifier: control
      keycode: char_t
      mode: [emacs, vi_normal, vi_insert]
      event: { send: menu name: commands_menu }
    }
    {
      name: vars_menu
      modifier: alt
      keycode: char_o
      mode: [emacs, vi_normal, vi_insert]
      event: { send: menu name: vars_menu }
    }
    {
      name: commands_with_description
      modifier: control
      keycode: char_s
      mode: [emacs, vi_normal, vi_insert]
      event: { send: menu name: commands_with_description }
    }


  ]

}
