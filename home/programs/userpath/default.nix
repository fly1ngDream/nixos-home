with import <nixpkgs> { };
with python3Packages;

buildPythonPackage rec {
  pname = "userpath";
  version = "1.4.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0mfjmvx286z1dmnrc7bm65x8gj8qrmkcyagl0vf5ywfq0bm48591";
  };

  propagatedBuildInputs = [ click distro ];

  # test suite is difficult to emulate in sandbox due to shell manipulation
  doCheck = false;

  pythonImportsCheck = [ "click" "userpath" ];
}
