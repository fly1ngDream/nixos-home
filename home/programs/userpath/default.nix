{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.programs.userpath;
  userpath = with pythonPkgs;
    pkgs.callPackage ../userpath/package.nix {
      buildPythonPackage = pythonPkgs.buildPythonPackage;
      click = click;
      distro = distro;
      pytest = pytest;
    };
in {
  options.programs.userpath = {
    enable = mkEnableOption
      "Cross-platform tool for adding locations to the user PATH";
  };

  config = mkIf cfg.enable { home.packages = [ userpath ]; };
}
