{ pkgs, ... }:

{
  nixpkgs = {
    overlays = [ ];
    config = {
      permittedInsecurePackages = [ ];
      allowUnsupportedSystem = true;
    };
  };

  home.packages = with pkgs;
    let
      myEmacs = (emacs.override {
        withGTK3 = true;
        withGTK2 = false;
      });
      flutter = flutterPackages.stable;
      myNodePackages = with nodePackages; [ deno prettier serverless ];
      comma = (import (builtins.fetchTarball
        "https://github.com/Shopify/comma/archive/master.tar.gz") {});
    in [
      # development
      ameba
      asciinema
      awscli
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
      glib
      gnome3.glade
      inotify-tools
      ix
      lld_10
      lua
      nasm
      nim
      openmpi
      redis
      ruby
      sass
      shellcheck
      shfmt
      tinygo
      texlive.combined.scheme-full
      wakatime
      # wasilibc
      openjdk8
      zig

      # nix stuff
      comma
      nix-index
      nix-prefetch-github
      nixpkgs-review
      nixfmt
      patchelf

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
      zoom-us

      # monitoring
      neofetch
      gotop
      speedtest-cli

      # passwords & security
      gopass
      pass

      # net & cloud tools
      ddgr
      doctl
      httpie
      insomnia
      miniserve
      netcat
      rclone
      telnet
      transmission-gtk

      # synchronization
      borgbackup
      syncthing-gtk

      # entertainment
      epr
      youtube-dl

      # my stuff
      bibata-cursors
      # swaylayout
      translate-shell
      blender
    ] ++ myNodePackages;
}
