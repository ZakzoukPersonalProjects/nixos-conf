{ pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "zed";
    VISUAL = "zed";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = false;
  };
}
