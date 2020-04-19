{ config, lib, pkgs, ... }:
with lib;
let cfg = config.programs.black;
in {
  options.programs.black = {
    enable = mkEnableOption "Black";
  };

  config = mkIf cfg.enable {
    xdg.configFile."black/pyproject.toml".source = ./.config/black/pyproject.toml;
  };
}
