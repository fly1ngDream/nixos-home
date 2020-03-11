{ lib, ... }:

with lib;

{
  imports = [ ../../profiles/boot/efi.nix ../../profiles/form/laptop.nix ];

  boot = {
    initrd.availableKernelModules = [ "xhci_pci" "nvme" "rtsx_pci_sdmmc" ];
    kernelModules = [ "kvm-intel" ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/ff71cd8b-5170-4d8e-8d76-15d66046ea2a";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/64A7-5338";
      fsType = "vfat";
    };
  };

  swapDevices = [{ device = "/dev/disk/by-uuid/98a32575-f67d-460c-bba5-353194000e1d"; }];

  nix.maxJobs = mkDefault 8;
}
