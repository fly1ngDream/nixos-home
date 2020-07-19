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

  boot = {
    cleanTmpDir = true;
    kernelPackages = pkgs.linuxPackages_5_4;
    binfmt.registrations = {
      go = {
        recognitionType = "extension";
        magicOrExtension = "go";
        interpreter = /usr/local/bin/gorun;
      };
    };
  };

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
    gtk3
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
    hasklig
    jetbrains-mono
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

  hardware = {
    enableRedistributableFirmware = true;
    pulseaudio = {
      enable = true;
      support32Bit = true;
      extraModules = [ pkgs.pulseaudio-modules-bt ];
      package = pkgs.pulseaudioFull;
      extraConfig = ''
        load-module module-switch-on-connect
      '';
    };
    squashfs.enable = true;
    opengl = {
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  networking = {
    networkmanager.enable = true;
    firewall.enable = false;
  };

  programs = {
    cachix = {
      enable = true;
      # packagesToCache = [ ];
    };
    dconf.enable = true;
    gnupg.agent.enable = true;
    iotop.enable = true;
    mosh.enable = true;
    mtr.enable = true;
    ssh.startAgent = true;
    thefuck.enable = true;
    zsh.enable = false;
    adb.enable = true;
    light.enable = true;
  };

  security.sudo.wheelNeedsPassword = false;

  services = {
    dbus.packages = [ pkgs.gnome3.dconf ];
    flatpak.enable = true;
    geoclue2.enable = true;
    blueman.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  systemd.services.bluetooth.serviceConfig.ExecStart =
    [ "" "${pkgs.bluez}/libexec/bluetooth/bluetoothd --noplugin=avrcp" ];

  time.timeZone = "Europe/Kiev";

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "20.03"; # Did you read the comment?

}
