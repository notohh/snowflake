{
  ...
}: {
  programs.lf = {
    enable = true;
    settings = {
      shell = "nushell";
      hidden = true;
      icons = true;
      drawbox = true;
      ignorecase = true;
    };
    extraConfig = ''
      
  '';
  };
  
}
