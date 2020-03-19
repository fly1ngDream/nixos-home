{ pkgs, ... }:

{

imports = [
  # Caches.
  ./cachix.nix
  # Enable system-wide modules.
  ./modules
  # Home-manager and related stuff.
  <home-manager/nixos>
  ./home
  # The host-specific configuration.
  ./host-configuration.nix
  # Any overrides you might want (temporarily).
  # ./overrides.nix
];

boot.cleanTmpDir = true;

boot.kernelPackages = pkgs.linuxPackages_5_4;

environment.pathsToLink = [ "share/zsh" ];

environment.systemPackages = with pkgs; [
  acl
  acpi
  bash
  binutils
  file
  gawk
  gcc9
  git
  gnumake
  lsb-release
  ncdu
  pamixer
  pavucontrol
  pciutils
  pmutils
  psmisc
  unrar
  unzip
  vim
  wget
];

fonts.fonts = with pkgs; [
  dejavu_fonts
  terminus_font
  fira-code
  fira-code-symbols
  font-awesome_5
  iosevka
  material-icons
  powerline-fonts
  roboto
  roboto-mono
];

hardware.enableRedistributableFirmware = true;

hardware.pulseaudio = {
  enable = true;
  support32Bit = true;
  extraModules = [ pkgs.pulseaudio-modules-bt ];
  package = pkgs.pulseaudioFull;
};

sound.enable = true;

sound.mediaKeys.enable = true;

hardware.squashfs.enable = true;

hardware.opengl = {
  driSupport = true;
  driSupport32Bit = true;
};

networking.networkmanager.enable = true;

networking.firewall.enable = false;

programs.cachix = {
  enable = true;
  # packagesToCache = [ ];
};

programs.dconf.enable = true;

programs.gnupg.agent.enable = true;

programs.iotop.enable = true;

programs.mosh.enable = true;

programs.mtr.enable = true;

programs.ssh.startAgent = true;

programs.thefuck.enable = true;

programs.zsh.enable = false;

programs.adb.enable = true;

security.sudo.wheelNeedsPassword = false;

services.dbus.packages = [ pkgs.gnome3.dconf ];

services.flatpak.enable = true;

xdg.portal = {
  enable = true;
  extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
};

services.geoclue2.enable = true;

services.xserver = {
  enable = true;
  displayManager.sddm.enable = true;
};

services.blueman.enable = true;

systemd.services.bluetooth.serviceConfig.ExecStart = [
  ""
  "${pkgs.bluez}/libexec/bluetooth/bluetoothd --noplugin=avrcp"
];

time.timeZone = "Europe/Kiev";

# This value determines the NixOS release with which your system is to be
# compatible, in order to avoid breaking some software such as database
# servers. You should change this only after NixOS release notes say you
# should.
system.stateVersion = "20.03"; # Did you read the comment?

}
