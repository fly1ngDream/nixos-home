{ lib
, pkgs ? import <nixpkgs> { }
, pythonPkgs ? pkgs.python38Packages
, fetchFromGitHub
}:

let userpath = pkgs.callPackage ../userpath/package.nix { };
in pythonPkgs.buildPythonPackage rec {
  pname = "pipx";
  version = "0.15.5.0";

  src = fetchFromGitHub {
    owner = "pipxproject";
    repo = pname;
    rev = version;
    sha256 = "13z032i8r9f6d09hssvyjpxjacb4wgms5bh2i37da2ili9bh72m6";
  };

  propagatedBuildInputs = with pythonPkgs; [ userpath argcomplete packaging ];

  doCheck = false;

  meta = {
    description = ''
      Install and Run Python Applications in Isolated Environments
    '';
  };
}
