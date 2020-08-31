{ config, pkgs, ... }:

{
  home-manager.useUserPackages = false;
  environment.homeBinInPath = true;

  users = {
    # Disable ad-hoc user management.
    mutableUsers = false;

    users.yevhens = {
      isNormalUser = true;
      extraGroups = [ "sudo" "wheel" "adbusers" ];
      hashedPassword = "$1$Z7X9FGwu$fBYUonPaBwqVPr60VjFw0/";
      shell = pkgs.zsh;
    };
    users.root.hashedPassword =
      "$6$r6a3R8oY.6wFlTx8$mgJ/kD/K.1tDNDeeUZSYMTpwGlXgg/vhOzbFVgrQTb5Vjj4J428k1hh6OBdOBESAP.lpSxEQiniry2FwZ0xlw0";
  };

  home-manager.users.yevhens = { pkgs, ... }: {
    imports = [ ./email.nix ./files ./packages.nix ./programs ./themes.nix ];

    nixpkgs.config = {
      allowUnfree = true;
      pulseaudio = true;
    };

    programs = {
      asdf.enable = false;
      crystal.enable = false;
      emacs = {
        enable = true;
        useHead = true;
      };
      git = {
        enable = true;
        pager = "diff-so-fancy";
      };
      next.enable = true;
      nodejs = {
        enable = true;
        yarn.enable = true;
      };
      prettier.enable = true;
      ruby = {
        enable = false;
        enableBuildLibs = true;
        provider = "nixpkgs";
        enableSolargraph = true;
      };
      python = {
        enable = true;
        extraPackages = with pkgs.python3Packages; [
          codecov
          grip
          mypy
          # nvchecker
          poetry
          python-language-server
        ];
        black.enable = true;
        pipx.enable = true;
        pylint.enable = true;
      };
      topgrade = {
        enable = true;
        config = {
          disable = [ "emacs" "gem" ];
          gitRepos = [ "~/.emacs.d" ];
        };
      };
      waybar.enable = true;
    };

    services = { lorri.enable = true; };
  };
}
