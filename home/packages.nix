{ pkgs, ... }:

{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = let rev = "master";
      in "https://github.com/filalex77/nixpkgs-overlay/archive/${rev}.tar.gz";
    }))
  ];

  home.packages = with pkgs;
    let
      myEmacs = (emacs.override {
        withGTK3 = true;
        withGTK2 = false;
      });
      steamWithLibs =
        (steam.override { extraPkgs = pkgs: [ libjpeg openssl_1_0_2 ]; });
      steam-run = (steamWithLibs.override { nativeOnly = true; }).run;
      flutter = (import (builtins.fetchTarball
        "https://github.com/babariviere/nixpkgs/archive/flutter-init.tar.gz") {}).flutter;
    in [
      # development
      ameba
      ccls
      clang-tools
      crystal
      editorconfig-core-c
      elixir
      erlang
      exercism
      fd
      gdb
      gnome3.glade
      insomnia
      ix
      lua
      nasm
      nim
      openmpi
      ruby
      sass
      shellcheck
      shfmt
      wakatime
      openjdk8
      zig
      dart
      flutter
      vscodium

      # nix stuff
      nix-index
      nix-prefetch-github
      nixpkgs-review
      patchelf

      # web browsers
      brave

      # documents
      gimp
      # gimp-with-plugins (broken)
      graphviz
      libreoffice-fresh
      pandoc

      # other ART (Awesome Rust Tools)
      exa
      diskus
      du-dust
      fd
      ffsend
      hexyl
      hyperfine
      just
      lsd
      pastel
      ruplacer
      sd
      tealdeer
      tokei
      websocat
      xsv
      zola

      # communication
      discord
      riot-desktop
      # slack
      tdesktop
      # weechat
      # zoom-us
      thunderbird

      # gaming software
      steamWithLibs
      steam-run
      wineFull
      winetricks

      # monitoring
      inxi
      neofetch
      glances
      speedtest-cli

      # passwords & security
      gopass
      pass

      # net & cloud tools
      ddgr
      doctl
      httpie
      miniserve
      rclone
      transmission-gtk

      # synchronization
      borgbackup
      syncthing-gtk

      # entertainment
      epr
      # python3Packages.mps-youtube
      youtube-dl

      # my stuff
      # swaylayout
      translate-shell
    ];
}
