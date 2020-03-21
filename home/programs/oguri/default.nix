{ config, lib, pkgs, ... }:
with lib;
let cfg = config.programs.oguri;
in {
  options.programs.oguri = {
    enable = mkEnableOption "Oguri";
  };

  config = mkIf cfg.enable {
    xdg.configFile."oguri/config".source = ./.config/oguri/config;
  };
}
