{ config, pkgs, ... }:

{
  home-manager.useUserPackages = false;
  environment.homeBinInPath = true;

  users = {
    # Disable ad-hoc user management.
    mutableUsers = false;

    users.yevhens = {
      isNormalUser = true;
      extraGroups =
        [ "sudo" "wheel" "adbusers" ];
      hashedPassword = "$1$Z7X9FGwu$fBYUonPaBwqVPr60VjFw0/";
      shell = pkgs.zsh;
    };
  };

  home-manager.users.yevhens = { pkgs, ... }: {
    imports = [ ./email.nix ./files ./packages.nix ./programs ./themes.nix ];

    nixpkgs.config = {
      allowUnfree = true;
      permittedInsecurePackages = [ "openssl-1.0.2u" ];
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
      ruby = {
        enable = false;
        enableBuildLibs = true;
        provider = "nixpkgs";
        enableSolargraph = true;
      };
      python = {
        enable = true;
        extraPackages = with pkgs.python3Packages; [ pip ipython httpx ];
        enableBuildLibs = true;
        provider = "nixpkgs";
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

    services = {
      lorri.enable = true;

    };
  };
}
