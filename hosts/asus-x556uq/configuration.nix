{
  imports = [
    ./hardware-configuration.nix
    ../../profiles/purpose/workstation.nix
  ];

  networking.hostName = "asus-x556uq";
}
