_: {
  programs.yazi.keymap = {
    manager.keymap = [
      {
        on = [ "<Esc>" ];
        run = "escape";
        desc = "Exit visual mode; clear selected; or cancel search";
      }
      {
        on = [ "q" ];
        run = "quit";
        desc = "Exit the process";
      }
      {
        on = [ "<C-q>" ];
        run = "close";
        desc = "Close the current tab; or quit if it is last tab";
      }

      # Navigation

      {
        on = [ "<Up>" ];
        run = "arrow -1";
        desc = "Move cursor up";
      }
      {
        on = [ "<Down>" ];
        run = "arrow 1";
        desc = "Move cursor down";
      }
      {
        on = [ "<Left>" ];
        run = "leave";
        desc = "Go back to the parent directory";
      }
      {
        on = [ "<Right>" ];
        run = "enter";
        desc = "Enter the child directory";
      }
      {
        on = [
          "g"
          "g"
        ];
        run = "arrow -99999999";
        desc = "Move cursor to the top";
      }
      {
        on = [ "G" ];
        run = "arrow 99999999";
        desc = "Move cursor to the bottom";
      }

      # Selection
      {
        on = [ "<Space>" ];
        run = [
          "select --state=none"
          "arrow 1"
        ];
        desc = "Toggle the current selection state";
      }
      {
        on = [ "i" ];
        run = "visual_mode";
        desc = "Enter visual mode (selection mode)";
      }
      {
        on = [ "I" ];
        run = "visual_mode --unset";
        desc = "Enter visual mode (unset mode)";
      }
      {
        on = [ "<C-a>" ];
        run = "select_all --state=true";
        desc = "Select all files";
      }
      {
        on = [ "<C-r>" ];
        run = "select_all --state=none";
        desc = "Inverse selection of all files";
      }

      # Operations

      {
        on = [ "<Enter>" ];
        run = "open";
        desc = "Open selected file(s)";
      }
      {
        on = [ "y" ];
        run = "yank";
        desc = "Copy selected file(s)";
      }
      {
        on = [ "x" ];
        run = "yank --cut";
        desc = "Cut selected file(s)";
      }
      {
        on = [ "p" ];
        run = "paste";
        desc = "Paste the file(s)";
      }
      {
        on = [ "P" ];
        run = "paste --force";
        desc = "Paste the files (overwrite)";
      }
      {
        on = [ "d" ];
        run = "remove --permanently";
        desc = "Permanently delete the file(s)";
      }
      {
        on = [ "D" ];
        run = "remove --permanently";
        desc = "Permanently delete the files(s)";
      }
      {
        on = [ "a" ];
        run = "create";
        desc = "create a file or directory (ends with / for directories)";
      }
      {
        on = [ "r" ];
        run = "rename";
        desc = "rename a file or directory";
      }
      {
        on = [ ":" ];
        run = "shell --block --interactive";
        desc = "run a blocking shell command";
      }
      {
        on = [ "." ];
        run = "hidden toggle";
        desc = "toggle hidden files";
      }
      {
        on = [ "z" ];
        run = "jump zoxide";
        desc = "jump to a directory using zoxide";
      }
      {
        on = [ "Z" ];
        run = "jump fzf";
        desc = "reveal files with fzf";
      }

      # Copy

      {
        on = [
          "c"
          "c"
        ];
        run = "copy path";
        desc = "copy the absolute path";
      }
      {
        on = [
          "c"
          "d"
        ];
        run = "copy dirname";
        desc = "copy parent directory path";
      }
      {
        on = [
          "c"
          "f"
        ];
        run = "copy filename";
        desc = "copy file name";
      }

      # Find

      {
        on = [ "/" ];
        run = "find";
      }
      {
        on = [ "?" ];
        run = "find --previous";
      }
      {
        on = [ "n" ];
        run = "find_arrow";
      }
      {
        on = [ "N" ];
        run = "find_arrow --previous";
      }
      {
        on = [ "s" ];
        run = "search fd";
      }
      {
        on = [ "S" ];
        run = "search rg";
      }
      {
        on = [ "<C-s>" ];
        run = "search none";
      }

      # Tabs

      {
        on = [ "t" ];
        run = "tab_create --current";
        desc = "Create a new tab using the current path";
      }

      {
        on = [ "1" ];
        run = "tab_switch 0";
        desc = "Switch to the first tab";
      }
      {
        on = [ "2" ];
        run = "tab_switch 1";
        desc = "Switch to the second tab";
      }
      {
        on = [ "3" ];
        run = "tab_switch 2";
        desc = "Switch to the third tab";
      }
      {
        on = [ "4" ];
        run = "tab_switch 3";
        desc = "Switch to the fourth tab";
      }
      {
        on = [ "5" ];
        run = "tab_switch 4";
        desc = "Switch to the fifth tab";
      }
      {
        on = [ "6" ];
        run = "tab_switch 5";
        desc = "Switch to the sixth tab";
      }
      {
        on = [ "7" ];
        run = "tab_switch 6";
        desc = "Switch to the seventh tab";
      }
      {
        on = [ "8" ];
        run = "tab_switch 7";
        desc = "Switch to the eighth tab";
      }
      {
        on = [ "9" ];
        run = "tab_switch 8";
        desc = "Switch to the ninth tab";
      }

      {
        on = [ "[" ];
        run = "tab_switch -1 --relative";
        desc = "Switch to the previous tab";
      }
      {
        on = [ "]" ];
        run = "tab_switch 1 --relative";
        desc = "Switch to the next tab";
      }
      {
        on = [ "{" ];
        run = "tab_swap -1";
        desc = "Swap the current tab with the previous tab";
      }
      {
        on = [ "}" ];
        run = "tab_swap 1";
        desc = "Swap the current tab with the next tab";
      }

      # Tasks

      {
        on = [ "w" ];
        run = "tasks_show";
        desc = "Show the tasks manager";
      }

      # Help

      {
        on = [ "~" ];
        run = "help";
        desc = "Open help";
      }
    ];
  };
}
