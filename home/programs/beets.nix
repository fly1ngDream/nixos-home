{
  programs.beets = {
    enable = false;
    settings = {
      directory = "~/music";
      library = "~/.config/beets/library.yaml";
      plugins = "fetchart lyrics convert duplicates";
    };
  };
}
