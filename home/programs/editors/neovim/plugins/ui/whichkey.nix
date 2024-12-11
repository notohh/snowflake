_: {
  programs.nixvim.plugins.which-key = {
    enable = true;
    settings = {
      preset = "helix";
      replace = {
        desc = [
          [
            "<space>"
            "SPACE"
          ]
          [
            "<leader>"
            "SPACE"
          ]
          [
            "<[cC][rR]>"
            "RETURN"
          ]
          [
            "<[tT][aA][bB]>"
            "TAB"
          ]
          [
            "<[bB][sS]>"
            "BACKSPACE"
          ]
        ];
        spec = [
          {
            __unkeyed-1 = "<leader>b";
            group = "Buffers";
            icon = "󰓩 ";
          }
          {
            __unkeyed = "<leader>c";
            group = "Codesnap";
            icon = "󰄄 ";
            mode = "v";
          }
          {
            __unkeyed-1 = "<leader>bs";
            group = "Sort";
            icon = "󰒺 ";
          }
          {
            __unkeyed-1 = [
              {
                __unkeyed-1 = "<leader>f";
                group = "Normal Visual Group";
              }
              {
                __unkeyed-1 = "<leader>f<tab>";
                group = "Normal Visual Group in Group";
              }
            ];
            mode = [
              "n"
              "v"
            ];
          }
          {
            __unkeyed-1 = "<leader>w";
            group = "windows";
            proxy = "<C-w>";
          }
          {
            __unkeyed-1 = "<leader>cS";
            __unkeyed-2 = "<cmd>CodeSnapSave<CR>";
            desc = "Save";
            mode = "v";
          }
          {
            __unkeyed-1 = "<leader>db";
            __unkeyed-2 = {
              __raw = ''
                function()
                  require("dap").toggle_breakpoint()
                end
              '';
            };
            desc = "Breakpoint toggle";
            mode = "n";
            silent = true;
          }
        ];
      };
    };
  };
}
