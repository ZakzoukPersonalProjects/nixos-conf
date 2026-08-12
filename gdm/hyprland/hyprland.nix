{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.displayManager.defaultSession = "hyprland";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}