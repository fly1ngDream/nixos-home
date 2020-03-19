{ pkgs, lib, ... }:

{
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluezFull;
  };
  services.illum.enable = true;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
