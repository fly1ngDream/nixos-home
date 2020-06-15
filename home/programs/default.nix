{ config, pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./asdf.nix
    ./aspell.nix
    ./beets.nix
    ./borgbackup.nix
    ./cmus
    ./crystal.nix
    ./direnv
    ./emacs
    ./firefox.nix
    ./git.nix
    ./home-manager.nix
    ./jetbrains.nix
    ./keybase.nix
    ./mpv.nix
    ./next.nix
    ./nodejs.nix
    ./oguri
    ./prettier
    ./python.nix
    ./ranger
    ./ripgrep.nix
    ./rofi
    ./rofi-pass.nix
    ./rtv
    ./ruby.nix
    ./rust
    ./scripts
    ./topgrade
    ./waybar
    ./zathura.nix
    ./zsh
  ];

  programs = {
    bash.enable = true;
    bat.enable = true;
    broot.enable = true;
    chromium = {
      enable = false;
      extensions = [
        "gcbommkclmclpchllfjekcdonpmejbdp" # HTTPS Everywhere
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      ];
    };
    command-not-found.enable = true;
    go.enable = true;
    google-chrome.enable = true;
    gpg.enable = true;
    htop.enable = true;
    jq.enable = true;
    kakoune.enable = true;
    oguri.enable = false;
    skim.enable = true;
    starship = {
      enable = false;
      settings = { };
    };
    tmux.enable = true;
    vim.enable = true;
    vscode.enable = true;
  };
}
