{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      monitor = ",preferred,auto,auto";
      bind = [
        "$mod, Q, exec, kitty"
      ];
    };
  };
}