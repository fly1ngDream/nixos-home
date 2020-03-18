{ config, lib, pkgs, ... }:
with lib;
let cfg = config.programs.pylint;
in {
  options.programs.pylint = {
    enable = mkEnableOption "Pylint";
  };

  config = mkIf cfg.enable {
    xdg.configFile."pylint/pylintrc".source = ./.config/pylint/pylintrc;
  };
}
