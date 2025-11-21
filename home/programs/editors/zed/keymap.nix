_: {
  programs.zed-editor.userKeymaps = [
    {
      context = "Workspace";
      bindings = {
        ctrl-shift-t = "workspace::NewTerminal";
      };
    }
    {
      context = "Editor";
      bindings = {
      };
    }
  ];
}
