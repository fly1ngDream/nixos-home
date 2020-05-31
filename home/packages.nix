{ pkgs, ... }:

{
  nixpkgs = {
    overlays = [];
    config = {
      permittedInsecurePackages = [];
    };
  };

  home.packages = with pkgs;
    let
      myEmacs = (emacs.override {
        withGTK3 = true;
        withGTK2 = false;
      });
      flutter = flutterPackages.stable;
      # nixpkgsMaster = (import (builtins.fetchTarball
      #   "https://github.com/NixOS/nixpkgs/archive/master.tar.gz") {});
    in [
      # development
      ameba
      ccls
      chromedriver
      clang-tools
      crystal
      dart
      editorconfig-core-c
      elixir
      elmPackages.elm
      elmPackages.elm-language-server
      erlang
      exercism
      fd
      flutter
      gdb
      gitAndTools.gh
      ghc
      gnome3.glade
      inotify-tools
      insomnia
      ix
      lua
      nasm
      nim
      nodePackages.live-server
      nodePackages.prettier
      nodePackages.serverless
      openmpi
      redis
      ruby
      sass
      shellcheck
      shfmt
      wakatime
      openjdk8
      zig
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
      slack
      tdesktop
      teams
      # weechat
      zoom-us
      thunderbird

      # monitoring
      inxi
      neofetch
      glances
      gotop
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
      bibata-cursors
      # swaylayout
      translate-shell
    ];
}
