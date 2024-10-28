_: {
  programs.nixvim.plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        offsets = [
          {
            filetype = "neo-tree";
            highlight = "Directory";
            text = "File Explorer";
            text_align = "center";
          }
        ];
      };
    };
  };
}
