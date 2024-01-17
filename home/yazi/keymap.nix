_: {
  programs.yazi.keymap = {
    manager.keymap = [
      {
        on = ["<Esc>"];
        exec = "escape";
        desc = "Exit visual mode; clear selected; or cancel search";
      }
      {
        on = ["q"];
        exec = "quit";
        desc = "Exit the process";
      }
      {
        on = ["<C-q>"];
        exec = "close";
        desc = "Close the current tab; or quit if it is last tab";
      }

      # Navigation

      {
        on = ["<Up>"];
        exec = "arrow -1";
        desc = "Move cursor up";
      }
      {
        on = ["<Down>"];
        exec = "arrow 1";
        desc = "Move cursor down";
      }
      {
        on = ["<Left>"];
        exec = "leave";
        desc = "Go back to the parent directory";
      }
      {
        on = ["<Right>"];
        exec = "enter";
        desc = "Enter the child directory";
      }
      {
        on = ["g" "g"];
        exec = "arrow -99999999";
        desc = "Move cursor to the top";
      }
      {
        on = ["G"];
        exec = "arrow 99999999";
        desc = "Move cursor to the bottom";
      }

      # Selection
      {
        on = ["<Space>"];
        exec = ["select --state=none" "arrow 1"];
        desc = "Toggle the current selection state";
      }
      {
        on = ["i"];
        exec = "visual_mode";
        desc = "Enter visual mode (selection mode)";
      }
      {
        on = ["I"];
        exec = "visual_mode --unset";
        desc = "Enter visual mode (unset mode)";
      }
      {
        on = ["<C-a>"];
        exec = "select_all --state=true";
        desc = "Select all files";
      }
      {
        on = ["<C-r>"];
        exec = "select_all --state=none";
        desc = "Inverse selection of all files";
      }

      # Operations

      {
        on = ["<Enter>"];
        exec = "open";
        desc = "Open selected file(s)";
      }
      {
        on = ["y"];
        exec = "yank";
        desc = "Copy selected file(s)";
      }
      {
        on = ["x"];
        exec = "yank --cut";
        desc = "Cut selected file(s)";
      }
      {
        on = ["p"];
        exec = "paste";
        desc = "Paste the file(s)";
      }
      {
        on = ["P"];
        exec = "paste --force";
        desc = "Paste the files (overwrite)";
      }
      {
        on = ["d"];
        exec = "remove --permanently";
        desc = "Permanently delete the file(s)";
      }
      {
        on = ["D"];
        exec = "remove --permanently";
        desc = "Permanently delete the files(s)";
      }
      {
        on = ["a"];
        exec = "create";
        desc = "create a file or directory (ends with / for directories)";
      }
      {
        on = ["r"];
        exec = "rename";
        desc = "rename a file or directory";
      }
      {
        on = [":"];
        exec = "shell --block";
        desc = "run a blocking shell command";
      }
      {
        on = ["."];
        exec = "hidden toggle";
        desc = "toggle hidden files";
      }
      {
        on = ["z"];
        exec = "jump zoxide";
        desc = "jump to a directory using zoxide";
      }
      {
        on = ["Z"];
        exec = "jump fzf";
        desc = "reveal files with fzf";
      }

      # Copy

      {
        on = ["c" "c"];
        exec = "copy path";
        desc = "copy the absolute path";
      }
      {
        on = ["c" "d"];
        exec = "copy dirname";
        desc = "copy parent directory path";
      }
      {
        on = ["c" "f"];
        exec = "copy filename";
        desc = "copy file name";
      }

      # Find

      {
        on = ["/"];
        exec = "find";
      }
      {
        on = ["?"];
        exec = "find --previous";
      }
      {
        on = ["n"];
        exec = "find_arrow";
      }
      {
        on = ["N"];
        exec = "find_arrow --previous";
      }
      {
        on = ["s"];
        exec = "search fd";
      }
      {
        on = ["S"];
        exec = "search rg";
      }
      {
        on = ["<C-s>"];
        exec = "search none";
      }

      # Tabs

      {
        on = ["t"];
        exec = "tab_create --current";
        desc = "Create a new tab using the current path";
      }

      {
        on = ["1"];
        exec = "tab_switch 0";
        desc = "Switch to the first tab";
      }
      {
        on = ["2"];
        exec = "tab_switch 1";
        desc = "Switch to the second tab";
      }
      {
        on = ["3"];
        exec = "tab_switch 2";
        desc = "Switch to the third tab";
      }
      {
        on = ["4"];
        exec = "tab_switch 3";
        desc = "Switch to the fourth tab";
      }
      {
        on = ["5"];
        exec = "tab_switch 4";
        desc = "Switch to the fifth tab";
      }
      {
        on = ["6"];
        exec = "tab_switch 5";
        desc = "Switch to the sixth tab";
      }
      {
        on = ["7"];
        exec = "tab_switch 6";
        desc = "Switch to the seventh tab";
      }
      {
        on = ["8"];
        exec = "tab_switch 7";
        desc = "Switch to the eighth tab";
      }
      {
        on = ["9"];
        exec = "tab_switch 8";
        desc = "Switch to the ninth tab";
      }

      {
        on = ["["];
        exec = "tab_switch -1 --relative";
        desc = "Switch to the previous tab";
      }
      {
        on = ["]"];
        exec = "tab_switch 1 --relative";
        desc = "Switch to the next tab";
      }
      {
        on = ["{"];
        exec = "tab_swap -1";
        desc = "Swap the current tab with the previous tab";
      }
      {
        on = ["}"];
        exec = "tab_swap 1";
        desc = "Swap the current tab with the next tab";
      }

      # Tasks

      {
        on = ["w"];
        exec = "tasks_show";
        desc = "Show the tasks manager";
      }

      # Help

      {
        on = ["~"];
        exec = "help";
        desc = "Open help";
      }
    ];
  };
}
