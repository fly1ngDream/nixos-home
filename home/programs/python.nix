{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.programs.python;
  python = pkgs.python3;
  pythonPackages = pkgs.python3Packages;
  myPythonPackages = pythonPackages: with pythonPackages; [ setuptools pip ];
  pythonWithMyPackages = python.withPackages myPythonPackages;
in {
  imports = [ ./black ./pylint ];

  options.programs.python = {
    enable = mkEnableOption "Python language support";
    extraPackages = mkOption {
      default = with pythonPackages; [ ];
      type = with types; listOf package;
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ pythonWithMyPackages ] ++ cfg.extraPackages;
  };
}
