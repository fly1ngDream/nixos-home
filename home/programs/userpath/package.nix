{ lib, buildPythonPackage, click, distro, pytest }:

buildPythonPackage rec {
  pname = "userpath";
  version = "1.4.1";

  src = builtins.fetchGit {
    url = "git://github.com/ofek/userpath.git";
    ref = "master";
    rev = "a763ba69a90368f69e3a054a8ceadb775ac78ff0";
  };

  propagatedBuildInputs = [ click distro pytest ];

  doCheck = false;

  meta = {
    description = ''
      Cross-platform tool for adding locations to the user PATH,
      no elevated privileges required!
    '';
  };
}
