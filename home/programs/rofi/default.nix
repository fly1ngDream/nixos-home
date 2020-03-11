{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    theme = "onedark";
  };

  xdg.dataFile."rofi/themes/DarkestDungeon.rasi".source = ./DarkestDungeon.rasi;
  xdg.dataFile."rofi/themes/onedark.rasi".source = ./onedark.rasi;
}
