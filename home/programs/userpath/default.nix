{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.programs.userpath;
  userpath = pkgs.callPackage ./package.nix { };
in {
  options.programs.userpath = {
    enable = mkEnableOption
      "Cross-platform tool for adding locations to the user PATH";
  };

  config = mkIf cfg.enable { home.packages = [ userpath ]; };
}
