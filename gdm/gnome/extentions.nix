{pkgs, ...}:

{
  environment.systemPackages = with pkgs.gnomeExtensions; [
    blur-my-shell
    vitals
    clipboard-indicator
    removable-drive-menu
    coverflow-alt-tab
    burn-my-windows
    tiling-shell
    gnome-wallpaper-engine
    screencast-extra-feature
  ];
}