{ pkgs, ... }: {
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "Ant-Dracula";
      package = pkgs.ant-dracula-theme;
    };
    gtk3.extraConfig.gtk-cursor-theme-name = "Bibata_Oil";
  };
  qt = {
    enable = true;
    platformTheme = "gtk";
  };
}
