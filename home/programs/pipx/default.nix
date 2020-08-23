{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.programs.pipx;
  pythonPkgs = pkgs.python38Packages;
  userpath = with pythonPkgs;
    pkgs.callPackage ../userpath/package.nix {
      buildPythonPackage = pythonPkgs.buildPythonPackage;
      click = click;
      distro = distro;
      pytest = pytest;
    };
  pipx = with pythonPkgs;
    pkgs.callPackage ./package.nix {
      buildPythonPackage = pythonPkgs.buildPythonPackage;
      userpath = userpath;
      argcomplete = argcomplete;
      packaging = packaging;
    };
in {
  options.programs.pipx = {
    enable = mkEnableOption
      "Install and Run Python Applications in Isolated Environments";
  };

  config = mkIf cfg.enable { home.packages = [ pipx ]; };
}
