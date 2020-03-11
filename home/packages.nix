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
    in [
      # development
      ameba
      ccls
      clang-tools
      crystal
      editorconfig-core-c
      elixir
      exercism
      gdb
      gnome3.glade
      insomnia
      ix
      lua
      nasm
      nim
      python3Packages.nvchecker
      python3
      ruby
      shellcheck
      shfmt
      wakatime
      zig

      # nix stuff
      nix-index
      nix-prefetch-github
      nixpkgs-review
      patchelf

      # documents
      gimp
      # gimp-with-plugins (broken)
      graphviz
      libreoffice-fresh
      pandoc
      python3Packages.grip

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
    ];
}
