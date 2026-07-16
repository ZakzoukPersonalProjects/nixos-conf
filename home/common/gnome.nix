{ lib, ... }:

{
  dconf.enable = true;

  dconf.settings = {

    "org/gnome/desktop/input-sources" = {
      sources = [
        (lib.hm.gvariant.mkTuple [ "xkb" "fr" ])
        (lib.hm.gvariant.mkTuple [ "xkb" "us" ])
      ];

      xkb-options = [
        grp:win_space_toggle
      ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      clock-format = "24h";
      show-battery-percentage = true;
      enable-hot-corners = false;
    };

    "org/gnome/desktop/privacy" = {
      remember-recent-files = false;
      remove-old-trash-files = true;
      remove-old-temp-files = true;
    };

    "org/gnome/nautilus/preferences" = {
      show-hidden-files = true;
      default-folder-viewer = "list-view";
    };

    "org/gnome/desktop/sound" = {
      event-sounds = false;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
    };
  };
}
