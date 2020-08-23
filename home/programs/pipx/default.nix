{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.programs.pipx;
  pipx = pkgs.callPackage ./package.nix {};
in {
  options.programs.pipx = {
    enable = mkEnableOption "Install and Run Python Applications in Isolated Environments";
  };

  config = mkIf cfg.enable {
    home.packages = [ pipx ];
  };
}
