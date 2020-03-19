{ pkgs, ... }:

{
  home.packages = with pkgs; [ xdg_utils ];

  home.file."bin" = {
    source = ./bin;
    recursive = true;
  };

  programs.zsh = {
    envExtra = ''
      export PATH="$HOME/bin:$PATH"
    '';
  };
}
