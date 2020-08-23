{ stdenv, buildPythonPackage, fetchFromGitHub, userpath, argcomplete, packaging
}:

buildPythonPackage rec {
  pname = "pipx";
  version = "0.15.5.0";

  src = fetchFromGitHub {
    owner = "pipxproject";
    repo = pname;
    rev = version;
    sha256 = "13z032i8r9f6d09hssvyjpxjacb4wgms5bh2i37da2ili9bh72m6";
  };

  propagatedBuildInputs = [ userpath argcomplete packaging ];

  doCheck = false;

  meta = with stdenv.lib; {
    description =
      "Install and Run Python Applications in Isolated Environments";
    homepage = "https://github.com/pipxproject/pipx";
    license = licenses.mit;
    maintainers = with maintainers; [ yevhenshymotiuk ];
  };
}
