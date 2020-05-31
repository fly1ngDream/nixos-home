{ pkgs, ... }: {
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "Adapta-Nokto-Eta";
      package = pkgs.adapta-gtk-theme;
    };
    # gtk3.extraConfig.cursor-theme-name = "Bibata_Oil";
  };
  qt = {
    enable = true;
    platformTheme = "gtk";
  };
}
