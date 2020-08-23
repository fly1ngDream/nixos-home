{ lib, pkgs ? import <nixpkgs> { }, pythonPkgs ? pkgs.python38Packages
, fetchFromGitHub }:

pythonPkgs.buildPythonPackage rec {
  pname = "userpath";
  version = "1.4.1";

  src = builtins.fetchGit {
    url = "git://github.com/ofek/userpath.git";
    ref = "master";
  };

  propagatedBuildInputs = with pythonPkgs; [ click distro pytest ];

  doCheck = false;

  meta = {
    description = ''
      Cross-platform tool for adding locations to the user PATH,
      no elevated privileges required!
    '';
  };
}
