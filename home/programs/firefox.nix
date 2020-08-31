{ pkgs, ... }:


{
  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox-wayland;
      profiles.default = {
        settings = {
          "browser.startup.homepage" = "https://zombiefox.github.io/nightTab/";
          "browser.search.defaultenginename" = "duckduckgo";
        };
        # userChrome = ''
        #   @namespace url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul");

        #   /* to hide the native tabs */
        #   #TabsToolbar {
        #       visibility: collapse !important;
        #   }

        #   /* to hide the sidebar header */
        #   #sidebar-header {
        #       display: none;
        #   }
        # '';
      };
    };
    zsh.sessionVariables.BROWSER = "firefox";
  };
}
