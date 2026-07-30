{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    settings = {
      "$mod" = "SUPER";
      monitor = ",preferred,auto,auto";
      # shared binds/rules go here
    };
  };
}