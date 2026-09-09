{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.vitals
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.removable-drive-menu
    gnomeExtensions.coverflow-alt-tab
    gnomeExtensions.burn-my-windows
    gnomeExtensions.tiling-shell
  ];
}