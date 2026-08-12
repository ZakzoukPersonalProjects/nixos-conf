{
  services.xserver.enable = true; # X11 windowing system
  services.displayManager.gdm.enable = true;
  services.displayManager.autoLogin.enable = false;

  imports = [
    ./gnome/gnome.nix
    ./hyprland/hyprland.nix
    # ./niri/niri.nix
  ];
}