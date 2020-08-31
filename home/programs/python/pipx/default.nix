{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.programs.python.pipx;
  pipx = import ../../pipx;
in {
  options.programs.python.pipx = {
    enable = mkEnableOption "pipx package manager";
  };

  config = mkIf cfg.enable {
    home.packages = [ pipx ];
  };
}
