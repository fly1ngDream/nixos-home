{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.python;
  python = pkgs.python3;
  pythonPackages = pkgs.python3Packages;
in {
  options.programs.python = {
    enable = mkEnableOption "Python language support";
    extraPackages = mkOption {
      default = with pythonPackages; [ requests pip ];
      type = with types; listOf package;
    };
    enableBuildLibs = mkEnableOption "build libraries for Python";
    provider = mkOption {
      default = "nixpkgs";
      type = types.enum [ "asdf" "nixpkgs" ];
      example = "asdf";
    };
  };

  config = mkIf cfg.enable {
    programs.python.extraPackages = mkIf cfg.enableBuildLibs
      (with pkgs; [ sqlite ]);

    home.packages = with pkgs;
      (optional (cfg.provider == "nixpkgs") python) ++ cfg.extraPackages;
  };
}
